import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/bloc/location.bloc.dart';
import 'package:foodie_delivery_boy/data/models/order_alert.dart';
import 'package:foodie_delivery_boy/data/repositories/order.repository.dart';
import 'package:foodie_delivery_boy/services/background_service.dart';
import 'package:foodie_delivery_boy/view_model/my_base.viewmodel.dart';
import 'package:foodie_delivery_boy/widgets/bottomsheets/new_order_alert.dart';
import 'package:vibration/vibration.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

class HomeViewModel extends MyBaseViewModel {
  //
  HomeViewModel(BuildContext context) {
    this.viewContext = context;
  }

  //
  int currentPageIndex = 0;
  PageController pageController = PageController();

  //
  LocationBloc locationBloc = LocationBloc();
  bool isOnline = false;
  bool canReceiveNewOrder = true;
  final assetsAudioPlayer = AssetsAudioPlayer();
  OrderRepository orderRepository = OrderRepository();

  //
  initialise() async {
    //
    await locationBloc.initBloc();
    //
    locationBloc.isOnline.listen((online) {
      if (online != null) {
        isOnline = online;
        notifyListeners();
      }
    });

    //
    await listenToNewOrder();
  }

  //update the current page index
  void updateCurrentPageIndex(int pageIndex) {
    currentPageIndex = pageIndex;
    pageController.animateToPage(
      pageIndex,
      curve: Curves.ease,
      duration: Duration(
        microseconds: 10,
      ),
    );
    //
    notifyListeners();
  }

  //
  void toggleOnlineStatus() async {
    //
    setBusy(true);
    await locationBloc.toggleOnlineStatus();
    setBusy(false);
  }

  //
  void listenToNewOrder() async {
    //orders details
    FirebaseDatabase.instance
        .reference()
        .child("new-orders")
        .onChildAdded
        .listen((event) {
      //
      final eventData = event.snapshot.value;
      print("Collected ==> ${eventData}");
      if (isOnline && canReceiveNewOrder) {
        //fetch order details
        print("Calling next");
        fetchOrderDetails(eventData['code']);
      }
    });
  }

  //
  fetchOrderDetails(String orderCode) async {
    //alert driver for new order
    final orderData = await FirebaseDatabase.instance
        .reference()
        .child("orders")
        .child(orderCode)
        .child('details')
        .once();

    if (orderData != null && locationBloc.currentLocation != null ) {
      //format data
      final orderAlert = OrderAlert.fromJson(orderData.value);
      orderAlert.code = orderCode;

      //calculate the distance
      var distanceBetweenDriverAndVendor = SphericalUtil.computeDistanceBetween(
        //vendor location
        LatLng(
          double.parse(orderAlert.from.latitude),
          double.parse(orderAlert.from.longitude),
        ),
        //driver current location
        LatLng(
          locationBloc.currentLocation.latitude,
          locationBloc.currentLocation.longitude,
        ),
      );

      //meters to kilometers
      distanceBetweenDriverAndVendor = distanceBetweenDriverAndVendor / 1000;
      //show new order alert to driver
      if (distanceBetweenDriverAndVendor <=
          double.parse(orderAlert.deliveryRange)) {
        showNewOrderAlert(orderAlert);
      }
      //
      print("Range ==> ${orderAlert.deliveryRange}");
      print("Distance ==> $distanceBetweenDriverAndVendor");
    } else {
      //
      print("seems to have been allocatted to another driver");
    }
  }

  //
  showNewOrderAlert(OrderAlert orderAlert) {
    //
    startOrderAlerting();

    //
    showModalBottomSheet(
      context: viewContext,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return NewOrderAlert(
          orderAlert: orderAlert,
          cancelOrderAlert: () =>
              processOrderAlertCancellation(orderAlert.code),
          acceptOrder: () => processOrderAlertAcceptance(orderAlert.code),
        );
      },
    );
  }

  //
  processOrderAlertCancellation(String orderCode) async {
    await stopOrderAlerting();
    viewContext.pop();
    canReceiveNewOrder = true;
  }

  //
  processOrderAlertAcceptance(String orderCode) async {
    await stopOrderAlerting();
    viewContext.pop();
    //
    final apiResponse = await orderRepository.acceptNewOrder(orderCode);
    viewContext.showToast(
      msg: apiResponse.message,
      bgColor: apiResponse.allGood ? Colors.green : Colors.red,
      textColor: Colors.white,
    );

    //
    if (apiResponse.allGood) {
      //
      BackgroundService.refreshOrderBehaviorSubject.add(true);
    }
    //
    canReceiveNewOrder = true;
  }

  //start notifing driver of new order
  startOrderAlerting() {
    //
    assetsAudioPlayer.open(
      Audio("assets/sounds/alert.mp3"),
      autoStart: true,
      showNotification: false,
      loopMode: LoopMode.single,
    );

    //Vibrate for the first 5secs
    try {
      Vibration.vibrate(duration: 5000);
    } catch (error) {
      print("Error with vibration ==> $error");
    }
  }

  //
  stopOrderAlerting() async {
    assetsAudioPlayer.stop();
    //Vibrate for the first 5secs
    try {
      await Vibration.cancel();
    } catch (error) {
      print("Error with vibration ==> $error");
    }
  }
}
