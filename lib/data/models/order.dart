import 'package:foodie_delivery_boy/data/models/user.dart';
import 'package:foodie_delivery_boy/data/models/currency.dart';
import 'package:foodie_delivery_boy/data/models/deliver_address.dart';
import 'package:foodie_delivery_boy/data/models/product.dart';
import 'package:foodie_delivery_boy/data/models/payment_option.dart';
import 'package:foodie_delivery_boy/data/models/vendor.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';

class Order {
  int id;
  String code;
  String date;
  String status;
  String paymentStatus;
  double subTotalAmount;
  double deliveryFee;
  double totalAmount;

  //
  Currency currency;
  Vendor vendor;
  DeliveryAddress deliveryAddress;
  PaymentOption paymentOption;
  User user;

  List<Product> products;

  Order({
    this.id,
    this.code,
    this.date,
    this.status,
    this.totalAmount,
  });

  factory Order.fromJSON({
    dynamic jsonObject,
  }) {
    final order = Order();
    order.id = jsonObject["id"];
    order.code = jsonObject["code"];
    order.date = jsonObject["created_at"];
    order.status = jsonObject["status"];
    order.paymentStatus = jsonObject["payment_status"];
    order.subTotalAmount =
        double.parse(jsonObject["sub_total_amount"].toString());
    order.deliveryFee = double.parse(jsonObject["delivery_fee"].toString());
    order.totalAmount = double.parse(jsonObject["total_amount"].toString());
    order.currency = Currency.fromJson(
      currencyJSONObject: jsonObject["currency"],
    );

    //user that order
    order.user = User.formJson(
      userJSONObject: jsonObject["user"],
      withRoles: false,
    );
    order.vendor = Vendor.fromJSON(
      jsonObject: jsonObject["vendor"],
      withExtras: false,
    );
    order.deliveryAddress = DeliveryAddress.fromJSON(
      jsonObject: jsonObject["delivery_address"],
    );
    order.paymentOption = PaymentOption.fromJSON(
      jsonObject: jsonObject["payment_option"],
    );

    //products
    order.products = (jsonObject["products"] as List).map(
      (foodJSONObject) {
        final mProduct = Product.fromJSON(
          jsonObject: foodJSONObject["product"],
          withExtras: false,
        );

        mProduct.price = double.parse(foodJSONObject["price"].toString());
        mProduct.selectedQuantity = foodJSONObject["quantity"];
        mProduct.extrasString = foodJSONObject["extras"];

        return mProduct;
      },
    ).toList();
    return order;
  }

  String get formattedDate {
    final orderDateTime = DateTime.parse(this.date);
    return DateFormat('dd MMM, yyyy', I18n.localeStr).format(orderDateTime);
  }

    bool isEnroute() {
    return status.toLowerCase() == "enroute";
  }

  bool isPending() {
    return status.toLowerCase() == "pending";
  }

  bool isDelivered() {
    return status.toLowerCase() == "delivered";
  }

  bool isFailed() {
    return status.toLowerCase() == "failed";
  }

  bool isCancelled() {
    return status.toLowerCase() == "cancelled";
  }
}
