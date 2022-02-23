import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_strings.dart';
import 'package:foodie_delivery_boy/utils/router.dart' as router;

class MyApp extends StatelessWidget {
  const MyApp({this.homeWidget, this.startRoute, Key key}) : super(key: key);

  final String startRoute;
  final Widget homeWidget;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      onGenerateRoute: router.generateRoute,
      initialRoute: startRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('es'),
        const Locale('de'),
        const Locale('pt'),
        const Locale('ar'),
        const Locale('ko'),
      ],
      home: homeWidget,
      theme: ThemeData(
        backgroundColor: Colors.white,
        accentColor: AppColor.accentColor,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColorDark,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.cursorColor,
        ),
      ),
    );
  }
}
