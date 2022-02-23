import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_routes.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/data/repositories/order.repository.dart';
import 'package:foodie_delivery_boy/services/background_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class AssignedOrderViewModel extends BaseViewModel {
  //delivery address repository
  OrderRepository ordersRepository = OrderRepository();
  int queryPage = 1;

  //BehaviorSubjects
  List<Order> orders = [];
  RefreshController refreshController = RefreshController();

  //
  initialise() {
    fetchAssignedOrders();

    //when driver accept new order, we need to refresh the page automatically
    BackgroundService.refreshOrderStream.listen((event) {
      if (event) {
        fetchAssignedOrders();
      }
    });
  }

  //
  void fetchAssignedOrders({
    bool initialLoading = true,
  }) async {
    if (initialLoading) {
      setBusy(true);
      queryPage = 1;
      refreshController.resetNoData();
    } else {
      queryPage++;
    }

    try {
      final mOrders = await ordersRepository.myOrders(
        page: queryPage,
        type: "",
      );

      if (initialLoading) {
        orders = mOrders;
      } else {
        orders.addAll(mOrders);
      }

      //prevent pull to load more
      if (mOrders.length == 0) {
        refreshController.loadNoData();
      } else {
        refreshController.refreshCompleted();
      }
    } catch (error) {
      print("Orders error ==> $error");
      setError(error);
    }

    setBusy(false);
  }

  //
  //show more info about the order
  void showOrderInfo(Order selectedOrder, BuildContext context) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.orderDetailsPage,
      arguments: selectedOrder,
    );

    //then done refresh orders list
    fetchAssignedOrders(initialLoading: true);
  }
}
