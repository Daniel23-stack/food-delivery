import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/view_model/assigned_orders.viewmodel.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:foodie_delivery_boy/widgets/custom_list_view.dart';
import 'package:foodie_delivery_boy/widgets/empty/empty_orders.dart';
import 'package:foodie_delivery_boy/widgets/order/order_item.dart';
import 'package:stacked/stacked.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class AssignedOrdersPage extends StatefulWidget {
  AssignedOrdersPage({Key key}) : super(key: key);

  @override
  _AssignedOrdersPageState createState() => _AssignedOrdersPageState();
}

class _AssignedOrdersPageState extends State<AssignedOrdersPage>
    with AutomaticKeepAliveClientMixin<AssignedOrdersPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ViewModelBuilder<AssignedOrderViewModel>.reactive(
      viewModelBuilder: () => AssignedOrderViewModel(),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) {
        return BasePage(
          title: "Assigned Orders".i18n,
          titleStyle: AppTextStyle.h1TitleTextStyle(),
          showLeadingAction: false,
          centerTitle: false,
          elevation: 0,
          appBarBg: Colors.transparent,
          body: CustomListView(
            isLoading: vm.isBusy,
            errorWidget: EmptyOrders(
              onRefreshPage: () {
                vm.fetchAssignedOrders(
                  initialLoading: true,
                );
              },
            ),
            emptyWidget: EmptyOrders(
              onRefreshPage: () {
                vm.fetchAssignedOrders(
                  initialLoading: true,
                );
              },
            ),
            canRefresh: true,
            canPullUp: true,
            refreshController: vm.refreshController,
            onRefresh: () => vm.fetchAssignedOrders(initialLoading: true),
            onLoading: () => vm.fetchAssignedOrders(initialLoading: false),
            itemBuilder: (context, index) {
              return OrderItem(
                order: vm.orders[index],
                onPressed: (order) => vm.showOrderInfo(order, context),
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 1,
            ),
            dataSet: vm.orders,
          ),
        );
      },
    );
  }
}
