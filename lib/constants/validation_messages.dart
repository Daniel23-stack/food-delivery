import 'package:foodie_delivery_boy/translations/validation.i18n.dart';
//all messages shown durring any validation can be found here
class ValidationMessages {
  // Invlaid name
  static String get invalidName => "Please enter a valid name".i18n;

  // Invlaid email address
  static String get invalidEmail => "Please enter a valid email address".i18n;
  static String get invalidPhoneNumber => "Please enter a valid phone number".i18n;
  // Invlaid password
  static String get invalidPassword => "Paasword must contain at least one(1) upper case and min 6 characters".i18n;

  static String get invalidDeliveryAddressName => "Please enter a valid name".i18n;
}
