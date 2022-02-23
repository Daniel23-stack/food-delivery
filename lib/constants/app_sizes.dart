import 'package:flutter/material.dart';

class AppSizes {
  static double customAppBarHeight = 170;
  static double secondCustomAppBarHeight = 100;

  static double inputHeight = 50;

  static double vendorImageHeight = 200;
  static double vendorPageImageHeight = 300;
  static double vendorPageInfoTopMargin = 230;
  static double vendorPageInfoCurveHeight = 50;

  static double foodImageHeight = 60;
  static double foodImageWidth = 60;

  static double foodExtraImageHeight = 50;
  static double foodExtraImageWidth = 50;

  static double userProfilePictureImageHeight = 100;
  static double userProfilePictureImageWidth = 100;

  static ShapeBorder containerTopRadiusShape() => RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      );

  static BorderRadiusGeometry containerTopBorderRadiusShape() =>
      BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      );

  static BorderRadiusGeometry containerBottomBorderRadiusShape() =>
      BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      );

  static BorderRadiusGeometry containerBorderRadiusShape(
          {double radius = 30}) =>
      BorderRadius.all(
        Radius.circular(radius),
      );
}
