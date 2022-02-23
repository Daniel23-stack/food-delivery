import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_paddings.dart';
import 'package:foodie_delivery_boy/constants/app_sizes.dart';
import 'package:foodie_delivery_boy/constants/app_text_styles.dart';
import 'package:foodie_delivery_boy/data/models/product.dart';
import 'package:foodie_delivery_boy/data/models/vendor.dart';
import 'package:foodie_delivery_boy/widgets/cornered_container.dart';

class ProductListViewItem extends StatelessWidget {
  ProductListViewItem({
    Key key,
    this.product,
    @required this.vendor,
  }) : super(key: key);

  final Product product;
  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //open product page
      },
      style: ElevatedButton.styleFrom(
        padding: AppPaddings.buttonPadding(),
        primary: Colors.white,
        elevation: 0,
      ),
      child: Row(
        children: <Widget>[
          //product image
          //if no product image was supplied, a shrink SizedBox will be added
          if (product.photoUrl.isNotEmpty)
            Hero(
              tag: product.id,
              child: CorneredContainer(
                child: CachedNetworkImage(
                  imageUrl: product.photoUrl,
                  placeholder: (context, url) => Container(
                    height: AppSizes.foodImageHeight,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: AppSizes.foodImageHeight,
                  width: AppSizes.foodImageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            SizedBox.shrink(),
          SizedBox(
            width: 20,
          ),
          //product info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.name,
                  style: AppTextStyle.h4TitleTextStyle(),
                ),
                Text(
                  "${vendor.currency.symbol} ${product.price}",
                  style: AppTextStyle.h5TitleTextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
