import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/data/models/user.dart';
import 'package:foodie_delivery_boy/widgets/buttons/custom_button.dart';
import 'package:foodie_delivery_boy/widgets/profile/user_profile_photo.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:foodie_delivery_boy/translations/profile.i18n.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({
    Key key,
    @required this.user,
    this.onEarningPressed,
  }) : super(key: key);

  final User user;
  final Function onEarningPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: AppColor.primaryColor,
      child: Container(
        padding: AppPaddings.defaultPadding(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //user profile photo
            UserProfilePhoto(
              userProfileImageUrl: user != null ? user.photo : "",
            ),

            //user full name
            SizedBox(
              height: 10,
            ),
            Text(
              user != null ? user.name : "",
              style: AppTextStyle.h3TitleTextStyle(
                color: Colors.white,
              ),
            ),
            //user email/phone
            Text(
              user != null ? user.email : "",
              style: AppTextStyle.h5TitleTextStyle(
                color: Colors.white,
              ),
            ),

            //earning
            //user email/phone
            CustomButton(
              child: "Earning".i18n.text.color(context.textTheme.bodyText1.color).make(),
              onPressed: onEarningPressed,
            ),
          ],
        ),
      ),
    );
  }
}
