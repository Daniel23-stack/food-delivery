import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_routes.dart';
import 'package:foodie_delivery_boy/views/auth/forgot_password_page.dart';
import 'package:foodie_delivery_boy/views/auth/login_page.dart';
import 'package:foodie_delivery_boy/views/auth/onboarding_page.dart';
import 'package:foodie_delivery_boy/views/chat/chat_page.dart';
import 'package:foodie_delivery_boy/views/home_page.dart';
import 'package:foodie_delivery_boy/views/orders/order_details_page.dart';
import 'package:foodie_delivery_boy/views/profile/change_password_page.dart';
import 'package:foodie_delivery_boy/views/profile/edit_profile_page.dart';
import 'package:foodie_delivery_boy/views/profile/notifications_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.welcomeRoute:
      return MaterialPageRoute(builder: (context) => OnboardingPage());

    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case AppRoutes.forgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgotPasswordPage());

    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (context) => HomePage());

    case AppRoutes.orderDetailsPage:
      return MaterialPageRoute(
          builder: (context) => OrderDetailsPage(
                order: settings.arguments,
              ));

    case AppRoutes.editProfileRoute:
      return MaterialPageRoute(builder: (context) => EditProfilePage());

    case AppRoutes.changePasswordRoute:
      return MaterialPageRoute(builder: (context) => ChangePasswordPage());

    case AppRoutes.notificationsRoute:
      return MaterialPageRoute(builder: (context) => NotificationsPage());

    //
    case AppRoutes.chatRoute:
      return MaterialPageRoute(
        builder: (context) => ChatPage(
          order: (settings.arguments as List)[0],
          withCustomer: (settings.arguments as List)[1],
        ),
      );

    default:
      return MaterialPageRoute(builder: (context) => OnboardingPage());
  }
}
