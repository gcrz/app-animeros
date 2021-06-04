import 'dart:async';
import 'dart:convert';

import 'package:app_animeros/model/profile_info.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DatabaseRemoteServer {
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();
  DatabaseRemoteServer._createInstance();

  String databaseUrl = "http://192.168.0.108:2000/notes";

  Dio _dio = Dio();

  Future<List<dynamic>> getProfileList() async {
    Response response = await _dio.request(this.databaseUrl,
        options:
            Options(method: "GET", headers: {"Accept": "application/json"}));

    List<ProfileInfo> profileList = [];
    List<int> idList = [];

    response.data.forEach((element) {
      ProfileInfo profileInfo = ProfileInfo.fromMap(element);
      profileList.add(profileInfo);
      idList.add(element["id"]);
    });

    return [profileList, idList];
  }

  Future<int> insertProfileInfo(ProfileInfo profileInfo) async {
    await _dio.post(this.databaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "username": profileInfo.username,
          "password": profileInfo.password,
          "email": profileInfo.email
        }));
    return 1;
  }

  Future<int> updateProfileInfo(int profileId, ProfileInfo profileInfo) async {
    await _dio.put(this.databaseUrl + "/$profileId",
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode(
            {"username": profileInfo.username, "email": profileInfo.email}));
    return 1;
  }

  static StreamController _controller;

  notify() async {
    if (_controller != null) {
      var response = await getProfileList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();

      Socket socket = io(
          "http://192.168.0.108:2000",
          OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
              .build());
      socket.on("invalidate", (_) => notify());
    }
    return _controller.stream.asBroadcastStream();
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = null;
    }
  }
}

void main() async {
  DatabaseRemoteServer profileServer = DatabaseRemoteServer._createInstance();
  var response = await profileServer.getProfileList();
  // 1° [0] se refere à lista de usuários cadastrado
  // 2° [0] se refere a posição do aluno cadastrado na lista
  ProfileInfo profileInfo = response[0][0];

  print(profileInfo.username);
  print(profileInfo.email);
  print(profileInfo.password);

  ProfileInfo testeProfile = ProfileInfo();
  testeProfile.username = "Ulisses GOD";
  testeProfile.password = "si700turmab";
  testeProfile.email = "ulisses@gmail.com";
  // profileServer.insertProfileInfo(testeProfile);
  profileServer.updateProfileInfo(0, testeProfile);
}
