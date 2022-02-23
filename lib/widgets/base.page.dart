import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class BasePage extends StatefulWidget {
  final bool showAppBar;
  final bool showLeadingAction;
  final String title;
  final Widget body;
  final Widget leading;
  final Widget bottomSheet;
  final Widget bottomNavigationBar;
  final Function onBackPressed;
  final double elevation;
  final bool centerTitle;
  final Color appBarBg;
  final Color bgColor;
  final TextStyle titleStyle;

  //
  final List<Widget> actions;

  BasePage({
    this.showAppBar = true,
    this.showLeadingAction = true,
    this.leading,
    this.onBackPressed,
    this.title = "",
    this.body,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.actions,
    this.elevation,
    this.centerTitle,
    this.appBarBg,
    this.bgColor,
    this.titleStyle,
    Key key,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          I18n.localeStr == "ar" ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: widget.bgColor ?? context.backgroundColor,
        appBar: widget.showAppBar
            ? AppBar(
                elevation: widget.elevation,
                automaticallyImplyLeading: widget.showLeadingAction,
                leading: widget.leading != null
                    ? widget.leading
                    : widget.showLeadingAction
                        ? IconButton(
                            icon: Icon(
                              FlutterIcons.arrow_left_fea,
                              color: Colors.white,
                            ),
                            onPressed: widget.onBackPressed ??
                                () => Navigator.pop(context),
                          )
                        : null,
                title: Text(
                  widget.title,
                  style: widget.titleStyle,
                ),
                actions: widget.actions,
                centerTitle: widget.centerTitle,
                backgroundColor: widget.appBarBg,
              )
            : null,
        body: widget.body,
        bottomSheet: widget.bottomSheet,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}
