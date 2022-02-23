import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/constants/app_color.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:shimmer/shimmer.dart';

class VendorShimmerListViewItem extends StatelessWidget {
  const VendorShimmerListViewItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBaseColor,
      highlightColor: AppColor.shimmerHighlightColor,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: 100,
            width: double.infinity,
          ),
          UiSpacer.verticalSpace(space: 10),
          Container(
            color: Colors.black,
            height: 10,
            width: double.infinity,
          ),
          UiSpacer.verticalSpace(space: 10),
          Container(
            color: Colors.black,
            height: 10,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
