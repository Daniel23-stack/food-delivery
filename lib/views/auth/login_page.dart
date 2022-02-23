import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/bloc/base.bloc.dart';
import 'package:foodie_delivery_boy/bloc/login.bloc.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_images.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_routes.dart';
import 'package:foodie_delivery_boy/constants/app_strings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/widgets/appbar/empty_appbar.dart';
import 'package:foodie_delivery_boy/widgets/buttons/custom_button.dart';
import 'package:foodie_delivery_boy/widgets/inputs/custom_text_form_field.dart';
import 'package:foodie_delivery_boy/widgets/platform/platform_circular_progress_indicator.dart';
import 'package:foodie_delivery_boy/translations/login.i18n.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //login bloc
  LoginBloc _loginBloc = LoginBloc();
  //email focus node
  final emailFocusNode = new FocusNode();
  //password focus node
  final passwordFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();

    //listen to the need to show a dialog alert or a normal snackbar alert type
    _loginBloc.showAlert.listen((show) {
      //when asked to show an alert
      if (show) {
        EdgeAlert.show(
          context,
          title: _loginBloc.dialogData.title,
          description: _loginBloc.dialogData.body,
          backgroundColor: _loginBloc.dialogData.backgroundColor,
          icon: _loginBloc.dialogData.iconData,
        );
      }
    });

    //listen to state of the ui
    _loginBloc.uiState.listen((uiState) {
      if (uiState == UiState.redirect) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.homeRoute,
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: EmptyAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          //page intro image
          Hero(
            tag: AppStrings.authImageHeroTag,
            child: Image.asset(
              AppImages.loginImage,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.45,
            ),
          ),

          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: AppPaddings.defaultPadding(),
            children: <Widget>[
              //page title
              Text(
                "Login".i18n,
                style: AppTextStyle.h1TitleTextStyle(),
              ),
              SizedBox(
                height: 30,
              ),
              //email/phone number textformfield
              StreamBuilder<bool>(
                stream: _loginBloc.validEmailAddress,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: "Email".i18n,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textEditingController: _loginBloc.emailAddressTEC,
                    errorText: snapshot.error,
                    onChanged: _loginBloc.validateEmailAddress,
                    focusNode: emailFocusNode,
                    nextFocusNode: passwordFocusNode,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              //password textformfield
              StreamBuilder<bool>(
                stream: _loginBloc.validPasswordAddress,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: "Password".i18n,
                    togglePassword: true,
                    obscureText: true,
                    textEditingController: _loginBloc.passwordTEC,
                    errorText: snapshot.error,
                    onChanged: _loginBloc.validatePassword,
                    focusNode: passwordFocusNode,
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              //forgot password button
              CustomButton(
                onPressed: () {
                  //open forgot password page
                  Navigator.pushNamed(
                    context,
                    AppRoutes.forgotPasswordRoute,
                  );
                },
                child: Text(
                  "Forgot Password?".i18n,
                  style: AppTextStyle.h4TitleTextStyle(
                    color: AppColor.accentColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //login button
              //listen to the uistate to know the appropriated state to put the login button
              StreamBuilder<UiState>(
                stream: _loginBloc.uiState,
                builder: (context, snapshot) {
                  final uiState = snapshot.data;

                  return CustomButton(
                    padding: AppPaddings.mediumButtonPadding(),
                    color: AppColor.accentColor,
                    onPressed: uiState != UiState.loading
                        ? _loginBloc.processLogin
                        : null,
                    child: uiState != UiState.loading
                        ? Text(
                            "Login".i18n,
                            style: AppTextStyle.h4TitleTextStyle(
                              color: Colors.white,
                            ),
                          )
                        : PlatformCircularProgressIndicator(),
                  );
                },
              ),
              UiSpacer.verticalSpace(),
            ],
          ),
        ],
      ),
    );
  }
}
