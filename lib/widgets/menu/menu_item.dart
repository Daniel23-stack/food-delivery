import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:velocity_x/velocity_x.dart';

class MenuItem extends StatefulWidget {
  MenuItem({
    Key key,
    this.iconData,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final Function onPressed;
  final IconData iconData;
  final String title;
  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      onPressed: widget.onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          0,
          AppPaddings.contentPaddingSize,
          0,
          AppPaddings.contentPaddingSize,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                widget.iconData,
                color: context.textTheme.bodyText1.color,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 8,
              child: Text(
                widget.title,
                style: context.textTheme.bodyText1.copyWith(
                  color: widget.onPressed != null ? null : Colors.grey[400],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Icon(
                SimpleLineIcons.arrow_right,
                size: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
