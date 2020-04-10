import 'dart:developer';

import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/screens/home_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:btmmall/services/service.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(()=> Service());
}

void main() {
  _setupLogging();
  setupLocator();
  runApp(MyApp());
}
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) => {
    print("${rec.level.name}: ${rec.time} : ${rec.message}")});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blueAccent
        ),
        home: ContentScreen(),
      ),
    );
  }
}
