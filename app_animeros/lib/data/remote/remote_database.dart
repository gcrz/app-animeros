import 'package:app_animeros/model/profile_info.dart';
import 'package:dio/dio.dart';

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
}
