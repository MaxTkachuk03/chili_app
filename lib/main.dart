import 'package:chili_app/chili_app.dart';
import 'package:chili_app/repository/internet_connection/check_internet.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerLazySingleton(
    () => const InternetConnection(),
  );

  //final dio = Dio();

  runApp(const ChiliApp());
}
