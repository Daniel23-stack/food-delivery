import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';

class AmountTile extends StatelessWidget {
  const AmountTile({
    Key key,
    this.title,
    this.amount,
    this.titleStyle,
    this.amountStyle,
  }) : super(key: key);

  final String title;
  final TextStyle titleStyle;
  final String amount;
  final TextStyle amountStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          this.title,
          style: this.titleStyle ?? AppTextStyle.h4TitleTextStyle(),
        ),
        Expanded(
          child: Text(
            this.amount,
            textAlign: TextAlign.end,
            style: this.amountStyle ?? AppTextStyle.h3TitleTextStyle(),
          ),
        ),
      ],
    );
  }
}
