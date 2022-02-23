import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/bloc/orders.bloc.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/utils/custom_dialog.dart';
import 'package:foodie_delivery_boy/widgets/empty/empty_orders.dart';
import 'package:foodie_delivery_boy/widgets/order/order_info.dart';
import 'package:foodie_delivery_boy/widgets/order/order_item.dart';
import 'package:foodie_delivery_boy/widgets/platform/platform_circular_progress_indicator.dart';
import 'package:foodie_delivery_boy/widgets/shimmers/general_shimmer_list_view_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class OrdersPage extends StatefulWidget {
  //
  OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with AutomaticKeepAliveClientMixin<OrdersPage> {
  @override
  bool get wantKeepAlive => true;

  //OrdersBloc instance
  OrdersBloc _ordersBloc = OrdersBloc();

  @override
  void initState() {
    super.initState();
    _ordersBloc.initBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _ordersBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Orders History".i18n,
          style: AppTextStyle.h1TitleTextStyle(),
        ),
        centerTitle: false,
      ),
      body: StreamBuilder<List<Order>>(
        stream: _ordersBloc.orders,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return EmptyOrders(
              onRefreshPage: () {
                _ordersBloc.fetchOrders(
                  initialLoading: true,
                );
              },
            );
          } else if (!snapshot.hasData) {
            return Padding(
              padding: AppPaddings.defaultPadding(),
              child: GeneralShimmerListViewItem(),
            );
          } else if (snapshot.data.length == 0) {
            return EmptyOrders(
              onRefreshPage: () {
                _ordersBloc.fetchOrders(
                  initialLoading: true,
                );
              },
            );
          }

          //list of orders
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load".i18n);
                } else if (mode == LoadStatus.loading) {
                  body = PlatformCircularProgressIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!".i18n);
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more".i18n);
                } else {
                  body = Text("No more Data".i18n);
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: _ordersBloc.refreshController,
            onRefresh: () {
              _ordersBloc.fetchOrders(
                initialLoading: true,
              );
            },
            onLoading: () {
              _ordersBloc.fetchOrders(
                initialLoading: false,
              );
            },
            child: ListView.separated(
              padding: AppPaddings.defaultPadding(),
              itemBuilder: (context, index) {
                return OrderItem(
                  order: snapshot.data[index],
                  onPressed: _showOrderInfo,
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
              itemCount: snapshot.data.length,
            ),
          );
        },
      ),
    );
  }

  //show more info about the order
  void _showOrderInfo(Order selectedOrder) {
    //show a bottomsheet of the order info
    CustomDialog.showCustomBottomSheet(
      context,
      content: OrderInfo(
        order: selectedOrder,
      ),
    );
  }
}
