import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/widgets/platform/platform_circular_progress_indicator.dart';
import 'package:foodie_delivery_boy/constants/app_images.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({
    Key key,
    this.onRefreshPage,
  }) : super(key: key);

  final Function onRefreshPage;

  @override
  Widget build(BuildContext context) {
    RefreshController refreshController = RefreshController(
      initialRefresh: false,
    );

    return Container(
      padding: AppPaddings.defaultPadding(),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        // header: WaterDropHeader(),
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
        onRefresh: onRefreshPage,
        controller: refreshController,
        child: ListView(
          children: <Widget>[
            Image.asset(
              AppImages.emptyOrder,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Center(
              child: Text(
                "Oops! No orders to see".i18n,
                style: AppTextStyle.h4TitleTextStyle(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Looks like you haven't been assigned to any order yet".i18n,
                style: AppTextStyle.h5TitleTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
