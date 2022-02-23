import 'package:foodie_delivery_boy/data/models/currency.dart';

class Earning {
  double total = 0;
  Currency currency;

  Earning();

  //
  factory Earning.fromJson(dynamic json) {
    final earning = Earning();
    earning.total = double.parse(json["total"].toString());
    earning.currency = Currency.fromJson(currencyJSONObject: json["currency"]);
    return earning;
  }
}
