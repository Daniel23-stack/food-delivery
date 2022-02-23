import 'package:foodie_delivery_boy/constants/api.dart';
import 'package:foodie_delivery_boy/data/models/api_response.dart';
import 'package:foodie_delivery_boy/data/models/earning.dart';
import 'package:foodie_delivery_boy/services/http.service.dart';
import 'package:foodie_delivery_boy/utils/api_response.utils.dart';

class EarningRepository extends HttpService {
  //
  Future<Earning> getMyEarning() async {
    //
    final apiResult = await get(Api.myEarning);

    //format the resposne
    ApiResponse apiResponse = ApiResponseUtils.parseApiResponse(apiResult);
    if (apiResponse.allGood) {
      return Earning.fromJson(apiResponse.body);
    }
    throw apiResponse.errors;
  }
}
