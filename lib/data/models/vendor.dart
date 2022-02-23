import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:foodie_delivery_boy/constants/app_strings.dart';
import 'package:foodie_delivery_boy/data/models/currency.dart';
import 'package:foodie_delivery_boy/data/models/menu.dart';

@Entity(
  tableName: "vendors",
)
class Vendor {
  @primaryKey
  int id;
  String name;
  String slug;
  String address;
  String latitude;
  String longitude;
  String featureImage;
  String logo;
  double rating;
  double minimumOrder;
  double deliveryFee;
  double deliveryRange;
  String cuisines;
  //both in mintues
  int minimumDeliveryTime;
  int maxmumDeliveryTime;

  //vendor page data
  @ignore
  List<Menu> menus;

  @ignore
  Currency currency;

  Vendor({
    this.id,
    this.name,
    this.slug,
    this.address,
    this.latitude = "0.0",
    this.longitude = "0.0",
    this.featureImage,
    this.logo,
    this.rating = 3.00,
    this.minimumOrder = 10.00,
    this.deliveryFee = 12.00,
    this.cuisines = "",
    this.minimumDeliveryTime = 30,
    this.maxmumDeliveryTime = 60,
    this.menus,
    this.currency,
  });

  String get deliveryTime =>
      "${this.minimumDeliveryTime} - ${this.maxmumDeliveryTime}";

  //
  factory Vendor.fromJSON({
    @required jsonObject,
    bool withExtras = true,
  }) {
    final vendor = Vendor();
    vendor.id = jsonObject["id"];
    vendor.name = jsonObject["name"];
    vendor.slug = jsonObject["slug"];
    vendor.slug += DateTime.now().millisecondsSinceEpoch.toString();
    vendor.address = jsonObject["address"];
    vendor.featureImage = jsonObject["feature_image"];
    vendor.logo = jsonObject["logo"];
    vendor.rating = double.parse(jsonObject["rating"].toString());
    vendor.minimumOrder = double.parse(
      jsonObject["minimum_order"].toString(),
    );
    vendor.deliveryFee = double.parse(
      jsonObject["delivery_fee"].toString(),
    );
    vendor.deliveryRange = double.parse(
      jsonObject["delivery_range"].toString(),
    );
    vendor.minimumDeliveryTime = int.parse(
      jsonObject["minimum_delivery_time"].toString(),
    );
    vendor.maxmumDeliveryTime = int.parse(
      jsonObject["maximum_delivery_time"].toString(),
    );
    vendor.latitude = jsonObject["latitude"];
    vendor.latitude = jsonObject["latitude"];

    if (withExtras) {
      //load the cuisines
      final cuisinesJSONArray = (jsonObject["cuisines"] as List);
      cuisinesJSONArray.asMap().forEach(
        (index, cuisineJSONObject) {
          vendor.cuisines += cuisineJSONObject["name"];
          if (index != cuisinesJSONArray.length - 1) {
            vendor.cuisines += " ${AppStrings.dot}";
          }
        },
      );

      //load the menus
      final menusJSONArray = (jsonObject["menus"] as List);
      vendor.menus = menusJSONArray
          .map(
            (menuJSONObject) => Menu.fromJSON(
              jsonObject: menuJSONObject,
              vendorId: vendor.id,
            ),
          )
          .toList();
    }

    return vendor;
  }
}
