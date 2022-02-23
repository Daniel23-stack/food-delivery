import 'package:foodie_delivery_boy/bloc/base.bloc.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/data/repositories/order.repository.dart';

class OrderDetailsBloc extends BaseBloc {
  //delivery address repository
  OrderRepository _ordersRepository = OrderRepository();

  void processOrderConfirmation({Order order}) async {
    setUiState(UiState.loading);

    dialogData = await _ordersRepository.confirmDelivery(
      order: order,
    );

    dialogData.isDismissible = true;
    setUiState(UiState.done);
    setShowDialogAlert(true);
  }
}
