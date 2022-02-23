import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/data/models/currency.dart';
import 'package:foodie_delivery_boy/widgets/order/order_product_info.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/data/models/product.dart';

class OrderProductsListView extends StatelessWidget {
  const OrderProductsListView({
    Key key,
    this.currency,
    this.products,
  }) : super(key: key);

  final Currency currency;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: AppPaddings.defaultPadding(),
      separatorBuilder: (context, index) => UiSpacer.verticalSpace(space: 10),
      itemBuilder: (context, index) {
        return OrderProductInfo(
          currency: this.currency,
          product: this.products[index],
        );
      },
      itemCount: products.length,
    );
  }
}
