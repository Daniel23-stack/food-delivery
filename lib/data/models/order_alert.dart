import 'dart:convert';

OrderAlert orderAlertFromJson(String str) => OrderAlert.fromJson(json.decode(str));

String orderAlertToJson(OrderAlert data) => json.encode(data.toJson());

class OrderAlert {
    OrderAlert({
        this.code,
        this.amount,
        this.deliveryRange,
        this.from,
        this.to,
    });

    String code;
    String amount;
    String deliveryRange;
    From from;
    From to;

    factory OrderAlert.fromJson(dynamic json) => OrderAlert(
        amount: json["amount"],
        deliveryRange: json["delivery_range"],
        from: From.fromJson(json["from"]),
        to: From.fromJson(json["to"]),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "delivery_range": deliveryRange,
        "from": from.toJson(),
        "to": to.toJson(),
    };
}

class From {
    From({
        this.address,
        this.latitude,
        this.longitude,
    });

    String address;
    String latitude;
    String longitude;

    factory From.fromJson(dynamic json) => From(
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
    };
}
