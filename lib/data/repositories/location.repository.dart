import 'package:foodie_delivery_boy/constants/api.dart';
import 'package:foodie_delivery_boy/data/models/api_response.dart';
import 'package:foodie_delivery_boy/data/models/dialog_data.dart';
import 'package:foodie_delivery_boy/services/http.service.dart';
import 'package:foodie_delivery_boy/utils/api_response.utils.dart';
import 'package:foodie_delivery_boy/translations/repository.i18n.dart';

class LocationRepository extends HttpService {
  //get my orders from server
  Future<DialogData> updateOnlineStatus({
    int online = 0,
  }) async {
    //instance of the model to be returned
    final resultDialogData = DialogData();

    //make http call for online status update
    final apiResult = await post(
      Api.updateOnlineStatus,
      {
        "online": online.toString(),
      },
    );

    // print("Result ==> $apiResult");
    //format the resposne
    ApiResponse apiResponse = ApiResponseUtils.parseApiResponse(apiResult);
    if (apiResponse.allGood) {
      resultDialogData.title = "Status Updated".i18n;
      resultDialogData.body = apiResponse.message;
      resultDialogData.dialogType = DialogType.success;
    } else {
      resultDialogData.title = "Status Updated Failed".i18n;
      resultDialogData.body = apiResponse.message;
      resultDialogData.dialogType = DialogType.failed;
    }

    return resultDialogData;
  }
}
