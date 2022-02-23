import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/data/database/app_database_singleton.dart';
import 'package:stacked/stacked.dart';

class MyBaseViewModel extends BaseViewModel {
  BuildContext viewContext;
  final formKey = GlobalKey<FormState>();
  final appDatabase = AppDatabaseSingleton.database;

  //
  void initialise() {}
}
