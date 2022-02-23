import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/data/models/order_alert.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class NewOrderAlert extends StatelessWidget {
  const NewOrderAlert({
    this.orderAlert,
    this.cancelOrderAlert,
    this.acceptOrder,
    Key key,
  }) : super(key: key);

  //
  final OrderAlert orderAlert;
  final Function cancelOrderAlert;
  final Function acceptOrder;
  @override
  Widget build(BuildContext context) {
    //
    CountDownController countDownController = CountDownController();

    //
    return BasePage(
      showAppBar: false,
      body: SafeArea(
        child: VStack(
          [
            //
            HStack(
              [
                //
                "New Order Alert".i18n
                    .text
                    .xl2
                    .white
                    .semiBold
                    .make()
                    .pOnly(bottom: Vx.dp14)
                    .expand(),

                //countdown ui
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CountDownProgressIndicator(
                    strokeWidth: 2,
                    controller: countDownController,
                    valueColor: Colors.white,
                    backgroundColor: Colors.blue,
                    initialPosition: 0,
                    timeTextStyle:
                        context.textTheme.headline6.copyWith(color: Colors.white),
                    //CHANGE THIS TO YOUR DESIRED ALERT DURATION
                    duration: 15,
                    // text: '',
                    onComplete: cancelOrderAlert,
                  ),
                ),
              ],
              crossAlignment: CrossAxisAlignment.center,
              alignment: MainAxisAlignment.center,
            ),

            //pickup address
            "From".i18n.text.lg.white.make(),
            orderAlert.from.address.text.xl.white.semiBold
                .maxLines(3)
                .overflow(TextOverflow.ellipsis)
                .make()
                .pOnly(bottom: Vx.dp14),

            //delivery address
            "To".i18n.text.lg.white.make(),
            orderAlert.to.address.text.xl.white.semiBold
                .maxLines(3)
                .overflow(TextOverflow.ellipsis)
                .make()
                .pOnly(bottom: Vx.dp14),

            //price
            "Amount".i18n.text.lg.white.make(),
            orderAlert.amount.text.xl2.white.semiBold
                .make()
                .pOnly(bottom: Vx.dp14),

            ConfirmationSlider(
              text: "SWIPE TO ACCEPT".i18n,
              textStyle: context.textTheme.headline6.copyWith(
                color: AppColor.primaryColor,
               ),
              foregroundColor: AppColor.primaryColor,
              onConfirmation: () {
                countDownController.pause();
                acceptOrder();
              },
            ).wFull(context),
          ],
        ).scrollVertical(),
      ).p20().box.color(AppColor.primaryColor).make(),
    );
  }
}
