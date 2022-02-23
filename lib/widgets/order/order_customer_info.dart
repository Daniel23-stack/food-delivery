import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:foodie_delivery_boy/utils/custom_dialog.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/widgets/buttons/custom_button.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:foodie_delivery_boy/translations/order.i18n.dart';

class OrderCustomerInfo extends StatelessWidget {
  const OrderCustomerInfo({
    Key key,
    this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.defaultPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //customer info header
          Row(
            children: <Widget>[
              Icon(
                AntDesign.infocirlceo,
              ),
              UiSpacer.horizontalSpace(),
              Text(
                "Customer Info".i18n,
                style: AppTextStyle.h3TitleTextStyle(),
              ),
            ],
          ),
          UiSpacer.verticalSpace(space: 10),
          Divider(
            thickness: 2,
          ),
          UiSpacer.verticalSpace(),
          //customer name
          Text(
            "Name".i18n,
            style: AppTextStyle.h5TitleTextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            order.user.name,
            style: AppTextStyle.h4TitleTextStyle(),
          ),
          UiSpacer.verticalSpace(),
          //customer phone
          Text(
            "Phone".i18n,
            style: AppTextStyle.h5TitleTextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  order.user.phone.isEmpty ? "Empty".i18n : order.user.phone,
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
              ),
              //direction button
              ButtonTheme(
                minWidth: 20,
                child: CustomButton(
                  elevation: 10,
                  color: AppColor.accentColor,
                  onPressed: () {
                    //open map for routing
                    launch("tel://${order.user.phone}");
                  },
                  child: Icon(
                    FlutterIcons.call_mdi,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          UiSpacer.verticalSpace(),
          //customer phone
          Text(
            "Delivery Address".i18n,
            style: AppTextStyle.h5TitleTextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  order.deliveryAddress.address,
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
              ),
              UiSpacer.horizontalSpace(),
              //direction button
              ButtonTheme(
                minWidth: 20,
                child: CustomButton(
                  elevation: 10,
                  color: AppColor.accentColor,
                  onPressed: () async {
                    //open map for routing
                    _openMapsSheet(context);
                  },
                  child: Icon(
                    FlutterIcons.location_arrow_faw,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          UiSpacer.verticalSpace(),
          //customer phone
          Text(
            "Vendor Address".i18n,
            style: AppTextStyle.h5TitleTextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  order.vendor.address,
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
              ),
              UiSpacer.horizontalSpace(),
              //direction button
              ButtonTheme(
                minWidth: 20,
                child: CustomButton(
                  elevation: 10,
                  color: AppColor.accentColor,
                  onPressed: () async {
                    //open map for routing
                    _openVendorMapsSheet(context);
                  },
                  child: Icon(
                    FlutterIcons.location_arrow_faw,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          UiSpacer.verticalSpace(),
        ],
      ),
    );
  }

  _openMapsSheet(context) async {
    try {
      final title = order.deliveryAddress.address;
      final description = "Delivery Address".i18n;
      final coords = Coords(
        double.parse(order.deliveryAddress.latitude),
        double.parse(order.deliveryAddress.longitude),
      );
      final availableMaps = await MapLauncher.installedMaps;

      CustomDialog.showCustomBottomSheet(
        context,
        content: SingleChildScrollView(
          child: Container(
            child: Wrap(
              children: <Widget>[
                for (var map in availableMaps)
                  ListTile(
                    onTap: () => map.showMarker(
                      coords: coords,
                      title: title,
                      description: description,
                    ),
                    title: Text(map.mapName),
                    leading: Image(
                      image: map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  _openVendorMapsSheet(context) async {
    try {
      final title = order.vendor.address;
      final description = "Vendor Address".i18n;
      final coords = Coords(
        double.parse(order.vendor.latitude),
        double.parse(order.vendor.longitude),
      );
      final availableMaps = await MapLauncher.installedMaps;

      CustomDialog.showCustomBottomSheet(
        context,
        content: SingleChildScrollView(
          child: Container(
            child: Wrap(
              children: <Widget>[
                for (var map in availableMaps)
                  ListTile(
                    onTap: () => map.showMarker(
                      coords: coords,
                      title: title,
                      description: description,
                    ),
                    title: Text(map.mapName),
                    leading: Image(
                      image: map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
      // showModalBottomSheet(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return SafeArea(
      //       child: SingleChildScrollView(
      //         child: Container(
      //           child: Wrap(
      //             children: <Widget>[
      //               for (var map in availableMaps)
      //                 ListTile(
      //                   onTap: () => map.showMarker(
      //                     coords: coords,
      //                     title: title,
      //                     description: description,
      //                   ),
      //                   title: Text(map.mapName),
      //                   leading: Image(
      //                     image: map.icon,
      //                     height: 30.0,
      //                     width: 30.0,
      //                   ),
      //                 ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // );
    } catch (e) {
      print(e);
    }
  }

}
