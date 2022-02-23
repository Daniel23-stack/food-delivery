import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_images.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/translations/profile.i18n.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.defaultPadding(),
      child: ListView(
        children: <Widget>[
          Image.asset(
            AppImages.emptyNotification,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Center(
            child: Text(
              "Oops! No notifications".i18n,
              style: AppTextStyle.h4TitleTextStyle(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "When you get notifications, they will show up here.".i18n,
              style: AppTextStyle.h5TitleTextStyle(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
