import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodie_delivery_boy/bloc/profile.bloc.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_routes.dart';
import 'package:foodie_delivery_boy/constants/app_strings.dart';
import 'package:foodie_delivery_boy/services/local_storage.service.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:foodie_delivery_boy/widgets/bottomsheets/language_selector.view.dart';
import 'package:foodie_delivery_boy/widgets/menu/menu_item.dart';
import 'package:foodie_delivery_boy/widgets/profile/user_profile_card.dart';
import 'package:foodie_delivery_boy/translations/profile.i18n.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  bool get wantKeepAlive => true;

  //profile bloc
  ProfileBloc _profileBloc;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //
    _profileBloc = new ProfileBloc(context);

    //biuld view
    return BasePage(
      showAppBar: false,
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: AppPaddings.defaultPadding(),
          children: <Widget>[
            //profile header
            StreamBuilder(
              stream: _profileBloc.appDatabase.userDao.findCurrentAsStream(),
              builder: (context, snapshot) {
                return UserProfileCard(
                  user: snapshot.data,
                  onEarningPressed: _profileBloc.showEarrning,
                );
              },
            ),

            //
            SizedBox(
              height: 20,
            ),

            //options
            //
            // My Details menu item
            MenuItem(
              iconData: FlutterIcons.user_ant,
              title: "Update Details".i18n,
              onPressed: () {
                // Edit profile
                Navigator.pushNamed(
                  context,
                  AppRoutes.editProfileRoute,
                );
              },
            ),
            Divider(
              height: 1,
            ),

            // Chnage password menu item
            MenuItem(
              iconData: FlutterIcons.lock_ant,
              title: "Change Password".i18n,
              onPressed: () {
                // Edit profile
                Navigator.pushNamed(
                  context,
                  AppRoutes.changePasswordRoute,
                );
              },
            ),
            Divider(
              height: 1,
            ),

            // Notifications menu item
            MenuItem(
              iconData: FlutterIcons.bells_ant,
              title: "Notifications".i18n,
              onPressed: () {
                // Edit profile
                Navigator.pushNamed(
                  context,
                  AppRoutes.notificationsRoute,
                );
              },
            ),
            Divider(
              height: 1,
            ),
            //Language
            MenuItem(
              iconData: FlutterIcons.language_ent,
              title: "Language".i18n,
              onPressed: _changeLanguage,
            ),
            Divider(
              height: 1,
            ),

            // Chat and faq menu item
            MenuItem(
              iconData: FlutterIcons.chat_bubble_outline_mdi,
              title: "FAQ's & Support".i18n,
              onPressed: null,
            ),
            Divider(
              height: 1,
            ),

            Divider(),
            MenuItem(
              iconData: AntDesign.logout,
              title: "Logout".i18n,
              onPressed: _processLogout,
            ),
            Divider(),
          ],
        ),
      ).py20(),
    );
  }

  //
  void _processLogout() async {
    await _profileBloc.logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.welcomeRoute,
      (route) => false,
    );
  }

  void _changeLanguage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AppLanguageSelector(
          onSelected: (code) async {
            await LocalStorageServices.prefs
                .setString(AppStrings.localeKey, code);
            I18n.of(context).locale = Locale(code ?? "en");
            context.pop();
          },
        );
      },
    );
  }
}
