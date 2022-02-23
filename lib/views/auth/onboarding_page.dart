import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_routes.dart';
import 'package:foodie_delivery_boy/constants/app_strings.dart';
import 'package:foodie_delivery_boy/services/local_storage.service.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:foodie_delivery_boy/widgets/bottomsheets/language_selector.view.dart';
import 'package:foodie_delivery_boy/widgets/cool_onboarding.dart';
import 'package:foodie_delivery_boy/widgets/onboarding_slide.dart';
import 'package:foodie_delivery_boy/translations/onboarding_page.i18n.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:velocity_x/velocity_x.dart';
class OnboardingPage extends StatefulWidget {
  OnboardingPage({
    Key key,
  }) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
 


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        changeLanguage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      body: CoolOnboarding(
        onSkipPressed: _completedOnboarding,
        onCompletedPressed: _completedOnboarding,
        indicatorDotColor: AppColor.onboardingIndicatorDotColor,
        indicatorActiveDotColor: AppColor.onboardingIndicatorActiveDotColor,
        onBoardingSlides: [
          OnboardingSlide(
            asset: "assets/animations/lottie/onboarding_1.json",
            title: "Assigned Orders".i18n,
            description:
                "You wiil be assigned delivery order by the administrator".i18n,
            backgroundColor: AppColor.onboarding1Color,
          ),
          OnboardingSlide(
            asset: "assets/animations/lottie/onboarding_2.json",
            title: "Delivery".i18n,
            description:
                "Pick up the ordered foods and drive to delivery address".i18n,
            backgroundColor: AppColor.onboarding2Color,
          ),
          OnboardingSlide(
            asset: "assets/animations/lottie/onboarding_4.json",
            title: "Delivery".i18n,
            description:
                "Deliver the ordered food at the delivery address and wait for the next order".i18n,
            backgroundColor: AppColor.onboarding3Color,
          ),
        ],
      ),
    );
  }


   void _completedOnboarding() {
    //route to login page
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.loginRoute,
      (route) => false,
    );
  }

   changeLanguage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AppLanguageSelector(
          onSelected: (code) async {
            await LocalStorageServices.prefs.setString(AppStrings.localeKey, code);
            I18n.of(context).locale = Locale(code ?? "en");
            context.pop();
          },
        );
      },
    );
  }
}
