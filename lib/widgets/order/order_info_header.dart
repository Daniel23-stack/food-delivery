import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_sizes.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class OrderInfoHeader extends StatelessWidget {
  const OrderInfoHeader({
    Key key,
    this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.defaultPadding(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSizes.containerBottomBorderRadiusShape(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Order Code".i18n,
                  style: AppTextStyle.h5TitleTextStyle(
                    color: AppColor.iconHintColor,
                  ),
                ),
                Text(
                  "#${order.code}",
                  style: AppTextStyle.h3TitleTextStyle(),
                ),
                //payment option
                UiSpacer.verticalSpace(space: 10),
                Text(
                  "Payment Option".i18n,
                  style: AppTextStyle.h6TitleTextStyle(
                    color: AppColor.iconHintColor,
                  ),
                ),
                Text(
                  order.paymentOption.name,
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
              ],
            ),
          ),

          //total amount
          Column(
            children: <Widget>[
              Text(
                "${order.currency.symbol} ${order.totalAmount}",
                style: AppTextStyle.h1TitleTextStyle(),
              ),
              //order date
              UiSpacer.verticalSpace(space: 20),
              Text(
                "Order Date".i18n,
                style: AppTextStyle.h6TitleTextStyle(
                  color: AppColor.iconHintColor,
                ),
              ),
              Text(
                order.formattedDate,
                style: AppTextStyle.h4TitleTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
