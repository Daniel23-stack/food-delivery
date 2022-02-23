import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/view_model/earning.vm.dart';
import 'package:foodie_delivery_boy/widgets/busy_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:foodie_delivery_boy/translations/profile.i18n.dart';

class EarningBottomSheet extends StatelessWidget {
  const EarningBottomSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: ViewModelBuilder<EarningViewModel>.reactive(
        viewModelBuilder: () => EarningViewModel(),
        onModelReady: (model) => model.fetchEarning(),
        builder: (context, model, child) {
          return SafeArea(
            child: model.isBusy
                ? BusyIndicator(color: AppColor.primaryColor)
                : VStack(
                    [
                      //
                      "${model.earning.currency.symbol}${model.earning.total.numCurrency}"
                          .text
                          .xl4
                          .bold
                          .makeCentered(),
                      "Current Earning".i18n.text.xl.medium.makeCentered(),
                    ],
                  ).centered().p20(),
          );
        },
      ),
    ).white.make().hOneForth(context);
  }
}
