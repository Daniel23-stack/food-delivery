import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_strings.dart';
import 'package:foodie_delivery_boy/data/database/app_database_singleton.dart';
import 'package:foodie_delivery_boy/my_app.dart';
import 'package:foodie_delivery_boy/services/firebase_messaging.dart';
import 'package:foodie_delivery_boy/services/local_storage.service.dart';
import 'package:foodie_delivery_boy/views/auth/onboarding_page.dart';
import 'package:foodie_delivery_boy/views/home_page.dart';
import 'package:i18n_extension/i18n_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize App Database
  await AppDatabaseSingleton().prepareDatabase();
  await LocalStorageServices.getPrefs();
  //start notification listening
  await Firebase.initializeApp();
  AppNotification.setUpFirebaseMessaging();

  //clear user records if any
  // await AppDatabaseSingleton.database.userDao.deleteAll();
  // await AppDatabaseSingleton.database.foodDao.deleteAll();
  // await AppDatabaseSingleton.database.foodExtraDao.deleteAll();

  // Set default home.
  Widget _startPage = new OnboardingPage();

  //check if user has signin before
  final user = await AppDatabaseSingleton.database.userDao.findCurrent();
  if (user != null) {
    _startPage = HomePage();
  }

  // Run app!
  runApp(
    I18n(
      child: MyApp(
        
        homeWidget: _startPage,
      ),
      initialLocale: Locale(
        LocalStorageServices.prefs.getString(AppStrings.localeKey) ?? "en",
      ),
    ),
  );
}
