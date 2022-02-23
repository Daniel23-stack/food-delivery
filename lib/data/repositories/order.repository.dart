import 'package:foodie_delivery_boy/data/models/dialog_data.dart';
import 'package:foodie_delivery_boy/constants/api.dart';
import 'package:foodie_delivery_boy/data/models/api_response.dart';
import 'package:foodie_delivery_boy/data/models/order.dart';
import 'package:foodie_delivery_boy/services/http.service.dart';
import 'package:foodie_delivery_boy/utils/api_response.utils.dart';

class OrderRepository extends HttpService {
  //get my orders from server
  Future<List<Order>> myOrders({
    int page = 1,
    String type = "history",
  }) async {
    List<Order> orders = [];

    //make http call for vendors data
    final apiResult = await get(Api.orders, queryParameters: {
      "page": page.toString(),
      "type": type,
    });

    // print("Api result ==> $apiResult");

    //format the resposne
    ApiResponse apiResponse = ApiResponseUtils.parseApiResponse(apiResult);
    if (!apiResponse.allGood) {
      throw apiResponse.errors;
    }

    //convert the data to list of delivery address model
    (apiResponse.body["data"] as List).forEach((orderJSONObject) {
      orders.add(Order.fromJSON(
        jsonObject: orderJSONObject,
      ));
    });
    return orders;
  }

  Future<DialogData> confirmDelivery({
    Order order,
  }) async {
    //instance of the model to be returned
    final resultDialogData = DialogData();
    //make http call for vendors data
    final apiResult = await patch(
      "${Api.orders}/${order.id}",
      {
        "status": "delivered",
      },
    );

    // print("Result ==> $apiResult");
    //format the resposne
    ApiResponse apiResponse = ApiResponseUtils.parseApiResponse(apiResult);
    if (apiResponse.allGood) {
      resultDialogData.title = "Order Completed";
      resultDialogData.body = apiResponse.message;
      resultDialogData.dialogType = DialogType.successThenClosePage;
    } else {
      resultDialogData.title = "Order Completion Failed!";
      resultDialogData.body = apiResponse.message;
      resultDialogData.dialogType = DialogType.failed;
    }

    return resultDialogData;
  }

  //
  Future<ApiResponse> acceptNewOrder(String orderCode) async {
    //make http call for vendors data
    final apiResult = await post("${Api.orders}/accept", {
      "code": orderCode,
    });

    print("Api result ==> $apiResult");

    //format the resposne
    return ApiResponseUtils.parseApiResponse(apiResult);
  }
}
