import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/view_model/home.viewmodel.dart';
import 'package:foodie_delivery_boy/views/orders/assigned_orders_page.dart';
import 'package:foodie_delivery_boy/views/orders/orders_page.dart';
import 'package:foodie_delivery_boy/views/profile/profile_page.dart';
import 'package:foodie_delivery_boy/widgets/base.page.dart';
import 'package:foodie_delivery_boy/widgets/busy_indicator.dart';
import 'package:foodie_delivery_boy/widgets/custom_bottom_navigation_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:foodie_delivery_boy/translations/home.i18n.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      onModelReady: (vm) => vm.initialise(),
      builder: (context, vm, child) {
        return BasePage(
          // backgroundColor: AppColor.appBackground,
          showAppBar: false,
          bottomNavigationBar: CustomBottomNavigationAppBar(
            selectedIndex: vm.currentPageIndex,
            onTabSelected: vm.updateCurrentPageIndex,
          ),
          body: Scaffold(
            floatingActionButton: vm.isBusy
                ? FloatingActionButton(
                    onPressed: null,
                    child: BusyIndicator(),
                  )
                : FloatingActionButton.extended(
                    onPressed: vm.toggleOnlineStatus,
                    label:
                        (vm.isOnline ? "Go Offline".i18n : "Go Online".i18n).text.make(),
                    icon: Icon(
                      vm.isOnline ? Icons.location_on : Icons.location_off,
                      color: Colors.white,
                    ),
                  ),
            body: PageView(
              controller: vm.pageController,
              children: <Widget>[
                AssignedOrdersPage(),
                OrdersPage(),
                ProfilePage(),
              ],
              onPageChanged: vm.updateCurrentPageIndex,
            ),
          ),
        );
      },
    );
  }
}
