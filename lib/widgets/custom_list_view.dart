import 'package:flutter/material.dart';
import 'package:foodie_delivery_boy/utils/ui_spacer.dart';
import 'package:foodie_delivery_boy/widgets/shimmers/general_shimmer_list_view_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomListView extends StatelessWidget {
  //
  final Widget title;
  final Widget loadingWidget;
  final Widget errorWidget;
  final Widget emptyWidget;
  final List<dynamic> dataSet;
  final bool isLoading;
  final bool hasError;
  final bool justList;
  final bool reversed;
  final bool noScrollPhysics;
  final Axis scrollDirection;
  final EdgeInsets padding;
  final Function(BuildContext, int) itemBuilder;
  final Function(BuildContext, int) separatorBuilder;

  //
  final bool canRefresh;
  final RefreshController refreshController;
  final Function onRefresh;
  final Function onLoading;
  final bool canPullUp;

  const CustomListView({
    @required this.dataSet,
    this.title,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.isLoading = false,
    this.hasError = false,
    this.justList = true,
    this.reversed = false,
    this.noScrollPhysics = false,
    this.scrollDirection = Axis.vertical,
    @required this.itemBuilder,
    this.separatorBuilder,
    this.padding,

    //
    this.canRefresh = false,
    this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.canPullUp = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.justList
        ? _getBody()
        : VStack(
            [
              this.title ?? UiSpacer.horizontalSpace(space: 0),
              _getBody(),
            ],
            crossAlignment: CrossAxisAlignment.start,
          );
  }

  Widget _getBody() {
    return this.isLoading
        ? this.loadingWidget ?? GeneralShimmerListViewItem()
        : this.hasError
            ? this.errorWidget ?? UiSpacer.horizontalSpace(space: 0)
            : this.justList
                ? this.dataSet.isEmpty
                    ? this.emptyWidget ?? UiSpacer.horizontalSpace(space: 0)
                    : _getBodyList()
                : Expanded(
                    child: _getBodyList(),
                  );
  }

  //
  Widget _getBodyList() {
    return this.canRefresh
        ? SmartRefresher(
            scrollDirection: this.scrollDirection,
            enablePullDown: true,
            enablePullUp: canPullUp,
            controller: this.refreshController,
            onRefresh: this.onRefresh,
            onLoading: this.onLoading,
            child: _getListView(),
          )
        : _getListView();
  }

  //get listview
  Widget _getListView() {
    return ListView.separated(
      padding: this.padding,
      shrinkWrap: true,
      reverse: this.reversed,
      physics: this.noScrollPhysics ? NeverScrollableScrollPhysics() : null,
      scrollDirection: this.scrollDirection,
      itemBuilder: this.itemBuilder,
      itemCount: this.dataSet.length,
      separatorBuilder: this.separatorBuilder ??
          (context, index) => this.scrollDirection == Axis.vertical
              ? UiSpacer.verticalSpace()
              : UiSpacer.horizontalSpace(),
    );
  }
}