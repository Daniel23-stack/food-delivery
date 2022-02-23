import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_sizes.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/widgets/order/amount_tile.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class OrderAmountInfo extends StatelessWidget {
  const OrderAmountInfo({
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
        borderRadius: AppSizes.containerTopBorderRadiusShape(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AmountTile(
            title: "Subtotal".i18n,
            amount: "${order.currency.symbol} ${order.subTotalAmount}",
          ),
          AmountTile(
            title: "Delivery Fee".i18n,
            amount: "${order.currency.symbol} ${order.deliveryFee}",
          ),
          Divider(),
          //payment option
          UiSpacer.verticalSpace(space: 10),
          AmountTile(
            title: "Total".i18n,
            titleStyle: AppTextStyle.h3TitleTextStyle(
              color: AppColor.primaryColor,
            ),
            amount: "${order.currency.symbol} ${order.totalAmount}",
            amountStyle: AppTextStyle.h3TitleTextStyle(
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
