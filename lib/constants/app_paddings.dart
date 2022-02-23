import 'package:flutter/material.dart';

class AppPaddings {
  static double contentPaddingSize = 20;
  static double buttonPaddingSize = 10;
  static double mediumButtonPaddingSize = 15;

  //default app padding
  static EdgeInsets defaultPadding() {
    return EdgeInsets.symmetric(
      vertical: contentPaddingSize,
      horizontal: contentPaddingSize,
    );
  }

  static EdgeInsets vendorPageContentPadding() {
    return EdgeInsets.fromLTRB(
      contentPaddingSize,
      0,
      contentPaddingSize,
      contentPaddingSize,
    );
  }

  static EdgeInsets buttonPadding() {
    return EdgeInsets.symmetric(
      vertical: buttonPaddingSize,
      horizontal: buttonPaddingSize,
    );
  }

  static EdgeInsets mediumButtonPadding() {
    return EdgeInsets.symmetric(
      vertical: mediumButtonPaddingSize,
      horizontal: mediumButtonPaddingSize,
    );
  }
}
