import 'dart:async';
import 'dart:io';

import 'package:app_animeros/model/profile_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();
  DatabaseLocalServer._createInstance();

  static Database _database;

  String profileInfoTable = "profile_info_table";
  String colId = "id";
  String colUsername = "username";
  String colEmail = "email";
  String colPassword = "password";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "/profileInfo_dt.db";

    Database profileDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return profileDatabase;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $profileInfoTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colUsername TEXT, $colEmail TEXT, $colPassword TEXT)");
  }

  // INSERÇÂO
  Future<int> insertProfileInfo(ProfileInfo profileInfo) async {
    Database db = await this.database;
    int result = await db.insert(profileInfoTable, profileInfo.toMap());
    notify();
    return result;
  }

  // SELEÇÂO
  getProfileList() async {
    Database db = await this.database;
    var profileMapList = await db.rawQuery("SELECT * FROM $profileInfoTable");

    List<ProfileInfo> profileList = [];
    List<int> idList = [];

    for (int i = 0; i < profileMapList.length; i++) {
      ProfileInfo profileInfo = ProfileInfo.fromMap(profileMapList[i]);
      profileList.add(profileInfo);
      idList.add(profileMapList[i]["id"]);
    }

    return [profileList, idList];
  }

  notify() async {
    if (_controller != null) {
      var response = await getProfileList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();
    }
    return _controller.stream.asBroadcastStream();
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = null;
    }
  }

  static StreamController _controller;
}

main() {
  var response = DatabaseLocalServer.helper.getProfileList();
  print(response[1]);
}
