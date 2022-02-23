class PaymentOption {
  int id;
  String name;
  String slug;
  String type;
  String logo;
  String description;
  String key;

  PaymentOption({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.logo,
    this.description,
    this.key,
  });

  factory PaymentOption.fromJSON({
    dynamic jsonObject,
  }) {
    final paymentOption = PaymentOption();
    paymentOption.id = jsonObject["id"];
    paymentOption.logo = jsonObject["logo"];
    paymentOption.name = jsonObject["name"];
    paymentOption.slug = jsonObject["slug"];
    paymentOption.type = jsonObject["type"];
    paymentOption.description = jsonObject["description"];
    paymentOption.key = jsonObject["key"];
    return paymentOption;
  }

  bool get isCard => this.type.toLowerCase() == "card";
  bool get isCash => this.type.toLowerCase() == "cash";
}
