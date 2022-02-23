import 'package:foodie_delivery_boy/data/models/api_response.dart';

class ApiResponseUtils {
  static ApiResponse parseApiResponse(dynamic response) {
    int code = response.statusCode;
    dynamic body = response.data ?? null; // Would mostly be a Map
    List errors = [];
    String message = "";

    switch (code) {
      case 200:
        message = (body is Map<String, dynamic>) ? body["message"] : "";
        break;
      default:
        message = body["message"] ??
            "Whoops! Something went wrong, please contact support.";
        errors.add(message);
        break;
    }

    return ApiResponse(
      code: code,
      message: message,
      body: body,
      errors: errors,
    );
  }
}
