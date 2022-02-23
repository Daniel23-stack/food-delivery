import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodie_delivery_boy/translations/home.i18n.dart';

class CustomBottomNavigationAppBar extends BottomNavigationBar {
  CustomBottomNavigationAppBar({
    Key key,
    int selectedIndex,
    Function onTabSelected,
  }) : super(
          key: key,
          currentIndex: selectedIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: onTabSelected,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.home_ant,
                size: 20,
              ),
              label: "Assigned".i18n,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                AntDesign.inbox,
                size: 20,
              ),
              label: "Order History".i18n,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.user_ant,
                size: 20,
              ),
              label: "Profile".i18n,
            ),
          ],
        );
}
