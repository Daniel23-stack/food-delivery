import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/view_model/order_details.viewmodel.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:foodie_delivery_boy/widgets/buttons/outline_custom_button.dart';
import 'package:foodie_delivery_boy/widgets/buttons/custom_button.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/views/orders/ordered_foods_header.dart';
import 'package:foodie_delivery_boy/widgets/appbar/leading_app_bar.dart';
import 'package:foodie_delivery_boy/widgets/order/order_amount_info.dart';
import 'package:foodie_delivery_boy/widgets/order/order_customer_info.dart';
import 'package:foodie_delivery_boy/widgets/order/order_products_list_view.dart';
import 'package:foodie_delivery_boy/widgets/order/order_info_header.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({
    Key key,
    this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderDetailsViewModel>.reactive(
      viewModelBuilder: () => OrderDetailsViewModel(order),
      builder: (context, vm, child) {
        return BasePage(
          bgColor: AppColor.appBackground,
          title: "Order Details".i18n,
          titleStyle: AppTextStyle.h3TitleTextStyle(),
          appBarBg: Colors.white,
          elevation: 0,
          leading: LeadingAppBar(),
          body: VStack(
            [
              //order info header
              OrderInfoHeader(
                order: vm.order,
              ),
              //order customer into
              OrderCustomerInfo(
                order: vm.order,
              ),

              //chat with customer
              (!order.isCancelled() &&
                      !order.isDelivered() &&
                      !order.isFailed())
                  ? CustomOutlineButton(
                      onPressed: () => vm.openChat(true, context),
                      color: AppColor.accentColor,
                      child: HStack(
                        [
                          Icon(
                            Icons.chat,
                            color: AppColor.accentColor,
                          ).pOnly(right: Vx.dp8),
                          Text(
                            "Chat with Customer".i18n,
                            style: context.textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ).centered(),
                    ).py4().px20()
                  : UiSpacer.horizontalSpace(space: 0),

              //chat vendor
              (!order.isCancelled() &&
                      !order.isDelivered() &&
                      !order.isFailed())
                  ? CustomOutlineButton(
                      onPressed: () => vm.openChat(false, context),
                      color: AppColor.accentColor,
                      child: HStack(
                        [
                          Icon(
                            Icons.chat,
                            color: AppColor.accentColor,
                          ).pOnly(right: Vx.dp8),
                          Text(
                            "Chat with Vendor".i18n,
                            style: context.textTheme.bodyText1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ).centered(),
                    ).py4().px20()
                  : UiSpacer.horizontalSpace(space: 0),

              //
              UiSpacer.verticalSpace(),

              //order foods
              OrderedFoodsHeader(
                total: vm.order.products.length,
              ),
              OrderProductsListView(
                currency: vm.order.currency,
                products: vm.order.products,
              ),
              //order amount details
              OrderAmountInfo(
                order: vm.order,
              ),
              //complete order
              Container(
                color: Colors.white,
                padding: AppPaddings.defaultPadding(),
                child: CustomButton(
                  padding: AppPaddings.mediumButtonPadding(),
                  color: AppColor.accentColor,
                  onPressed: () => vm.initiateOrderDeliveryCompletion(context),
                  loading: vm.isBusy,
                  child: Text(
                    "Complete Order".i18n,
                    style: AppTextStyle.h4TitleTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ).wFull(context),
              ),
            ],
          ).scrollVertical(),
        );
      },
    );
  }
}
