import 'dart:async';

import 'package:foodie_delivery_boy/data/database/app_database.dart';

class AppDatabaseSingleton {
  static AppDatabase database;

  Future<AppDatabase> prepareDatabase() async {
    if (database != null) return database;
    database = await $FloorAppDatabase
        .databaseBuilder('foodie_delivery_boy.db')
        .build();
    return database;
  }
}
