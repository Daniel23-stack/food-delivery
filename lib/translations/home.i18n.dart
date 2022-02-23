import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Go Offline",
        "fr": "Se déconnecter",
        "es": "Salir de línea",
        "de": "Gehe offline",
        "pt": "Desconecte",
        "ar": "انطلق دون اتصال",
        "ko": "접속을 끊다"
      } +
      {
        "en": "Go Online",
        "fr": "Aller en ligne",
        "es": "Ir en línea",
        "de": "Online gehen",
        "pt": "Fique online",
        "ar": "اتصل بالانترنت",
        "ko": "온라인으로"
      } +
      {
        "en": "Assigned",
        "fr": "Attribué",
        "es": "Asignado",
        "de": "Zugewiesen",
        "pt": "Atribuído",
        "ar": "مكلف",
        "ko": "할당 됨"
      } +
      {
        "en": "Order History",
        "fr": "Historique des commandes",
        "es": "Historial de pedidos",
        "de": "Bestellverlauf",
        "pt": "Histórico de pedidos",
        "ar": "تاريخ الطلب",
        "ko": "주문 내역"
      } +
      {
        "en": "Profile",
        "fr": "Profil",
        "es": "Perfil",
        "de": "Profil",
        "pt": "Perfil",
        "ar": "الملف الشخصي",
        "ko": "프로필"
      };

  String get i18n => localize(this, _t);
}
