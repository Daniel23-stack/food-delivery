import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:foodie_delivery_boy/data/models/product_extra.dart';

@Entity(
  tableName: "products",
)
class Product {
  @primaryKey
  int id;
  int vendorId;
  String name;
  String photoUrl;
  double price;
  double priceWithExtras;
  int selectedQuantity;
  String description;
  @ignore
  List<ProductExtra> extras;

  @ignore
  String extrasString;

  Product({
    this.id,
    this.vendorId,
    this.name,
    this.description,
    this.price,
    this.priceWithExtras,
    this.selectedQuantity,
    this.photoUrl,
    this.extras,
    this.extrasString,
  });

  factory Product.fromJSON({
    @required jsonObject,
    bool withExtras = true,
  }) {
    final product = Product();
    product.id = jsonObject["id"];
    product.name = jsonObject["name"];
    product.photoUrl = jsonObject["image"];
    product.description = jsonObject["description"];
    product.price = double.parse(
      jsonObject["price"].toString(),
    );

    if (withExtras) {
      //load extras
      final extrasJSONArray = (jsonObject["extras"] as List);
      product.extras = extrasJSONArray.map(
        (extraSONObject) {
          final productExtra = ProductExtra.fromJSON(
            jsonObject: extraSONObject,
          );
          productExtra.productId = product.id;
          return productExtra;
        },
      ).toList();
    }
    return product;
  }

  double get totalPriceWithExtra =>
      this.selectedQuantity * this.priceWithExtras;
}
