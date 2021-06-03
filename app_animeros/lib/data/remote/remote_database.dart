import 'package:dio/dio.dart';

class DatabaseRemoteServer {
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();
  DatabaseRemoteServer._createInstance();

  String databaseUrl = "http://192.168.0.108:2000/notes";

  Dio _dio = Dio();

}