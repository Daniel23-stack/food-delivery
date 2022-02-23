import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_routes.dart';
import 'package:foodie_delivery_boy/data/models/dialog_data.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/data/repositories/order.repository.dart';
import 'package:foodie_delivery_boy/utils/custom_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetailsViewModel extends BaseViewModel {
  //delivery address repository
  OrderRepository ordersRepository = OrderRepository();
  Order order;

  //
  OrderDetailsViewModel(this.order);

  //
  initialise() {}

  //

  void processOrderConfirmation(Order order, BuildContext context) async {
    setBusy(true);

    final dialogData = await ordersRepository.confirmDelivery(order: order);
    setBusy(false);

    if (dialogData.dialogType == DialogType.failed) {
      dialogData.isDismissible = true;
      dialogData.negativeButtonTitle = "Close";
      dialogData.positiveButtonTitle = "Try-again";

      CustomDialog.showConfirmationActionAlertDialog(context, dialogData,
          negativeButtonAction: () => context.pop(),
          positiveButtonAction: () {
            context.pop();
            processOrderConfirmation(order, context);
          });
    } else {
      CustomDialog.showAlertDialog(context, dialogData);
    }
  }

  //confirm order completion first before sending request to api/server
  void initiateOrderDeliveryCompletion(BuildContext context) {
    //show confirmation dialog
    final dialogData = DialogData();
    dialogData.title = "Delivery Confirmation";
    dialogData.body =
        "You are about to confirm delivery. Would you please confirm once again that you have deliver order to customer?";
    dialogData.dialogType = DialogType.warning;
    dialogData.negativeButtonTitle = "No, Cancel";
    dialogData.positiveButtonTitle = "Yes, Confirm";
    CustomDialog.showConfirmationActionAlertDialog(
      context,
      dialogData,
      isDismissible: true,
      negativeButtonAction: () => CustomDialog.dismissDialog(context),
      positiveButtonAction: () {
        context.pop();
        //send request to server
        processOrderConfirmation(order, context);
      },
    );
  }

  //
  openChat(bool withCustomer, BuildContext context) {
    //
    context.navigator.pushNamed(
      AppRoutes.chatRoute,
      arguments: [order, withCustomer],
    );
  }
}
