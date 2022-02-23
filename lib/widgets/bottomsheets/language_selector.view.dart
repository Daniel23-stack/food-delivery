import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:foodie_delivery_boy/widgets/listitem/page_menu.list_item.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:foodie_delivery_boy/translations/profile.i18n.dart';

class AppLanguageSelector extends StatelessWidget {
  const AppLanguageSelector({this.onSelected, Key key}) : super(key: key);

  //
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BasePage(
        showAppBar: false,
        body: VStack(
          [
            //
            "Select your preferred language".i18n
                .text.color(context.textTheme.bodyText1.color)
                .xl
                .semiBold
                .make()
                .py20(),

            //Arabic
            PageMenuItem(
              title: "Arabic",
              suffix: Flag('AE', height: 24, width: 24),
              onPressed: () => onSelected('ar'),
            ),
            //English
            PageMenuItem(
              title: "English",
              suffix: Flag('US', height: 24, width: 24),
              onPressed: () => onSelected('en'),
            ),
            //French
            PageMenuItem(
              title: "French",
              suffix: Flag('FR', height: 24, width: 24),
              onPressed: () => onSelected('fr'),
            ),
            //Spanish
            PageMenuItem(
              title: "Spanish",
              suffix: Flag('ES', height: 24, width: 24),
              onPressed: () => onSelected('es'),
            ),
            //German
            PageMenuItem(
              title: "German",
              suffix: Flag('DE', height: 24, width: 24),
              onPressed: () => onSelected('de'),
            ),
            //Portuguese
            PageMenuItem(
              title: "Portuguese",
              suffix: Flag('PT', height: 24, width: 24),
              onPressed: () => onSelected('pt'),
            ),
            //Korean
            PageMenuItem(
              title: "Korean",
              suffix: Flag('KR', height: 24, width: 24),
              onPressed: () => onSelected('ko'),
            ),

            //ADD YOUR CUSTOM LANGUAGE HERE
            // PageMenuItem(
            //   title: "LANGUAGE_NAME",
            //   suffix: Flag('COUNRTY_CODE', height: 24, width: 24),
            //   onPressed: () => onSelected('LANGUAGE_CODE'),
            // ),
          ],
        ).p20().scrollVertical(),
      ),
    ).box.color(context.backgroundColor).make();
  }
}