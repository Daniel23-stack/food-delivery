import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class OrderedFoodsHeader extends StatelessWidget {
  const OrderedFoodsHeader({
    Key key,
    this.total,
  }) : super(key: key);

  final int total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPaddings.contentPaddingSize,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FlutterIcons.food_mco,
                size: 32,
              ),
              UiSpacer.horizontalSpace(),
              Expanded(
                child: Text(
                  "Ordered Food".i18n+" ($total)",
                  style: AppTextStyle.h3TitleTextStyle(),
                ),
              ),
            ],
          ),
          //
          UiSpacer.verticalSpace(space: 10),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
