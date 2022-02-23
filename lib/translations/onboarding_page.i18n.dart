import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Finish",
        "fr": "Finir",
        "es": "Terminar",
        "de": "Fertig",
        "pt": "Terminar",
        "ar": "ينهي",
        "ko": "끝"
      } +
      {
        "en": "Skip",
        "fr": "Sauter",
        "es": "Saltar",
        "de": "Überspringen",
        "pt": "Pular",
        "ar": "يتخطى",
        "ko": "건너 뛰기"
      } +
      {
        "en": "Next",
        "fr": "Suivant",
        "es": "próximo",
        "de": "Nächster",
        "pt": "Próximo",
        "ar": "التالي",
        "ko": "다음"
      } +
      {
        "en": "Start",
        "fr": "Démarrer",
        "es": "Comienzo",
        "de": "Start",
        "pt": "Começar",
        "ar": "بداية",
        "ko": "스타트"
      } +
      {
        "en": "Assigned Orders",
        "fr": "Ordres attribués",
        "es": "Órdenes asignadas",
        "de": "Zugewiesene Aufträge",
        "pt": "Pedidos Atribuídos",
        "ar": "الأوامر المعينة",
        "ko": "지정된 주문"
      } +
      {
        "en": "You wiil be assigned delivery order by the administrator",
        "fr": "Le bon de livraison vous sera attribué par l'administrateur",
        "es": "El administrador le asignará la orden de entrega",
        "de": "Sie erhalten vom Administrator einen Lieferauftrag",
        "pt": "Você receberá ordem de entrega pelo administrador",
        "ar": "سيتم تعيين أمر التسليم لك من قبل المسؤول",
        "ko": "관리자에 의해 배송 주문이 지정됩니다."
      } +
      {
        "en": "Delivery",
        "fr": "Livraison",
        "es": "Entrega",
        "de": "Lieferung",
        "pt": "Entrega",
        "ar": "توصيل",
        "ko": "배달"
      } +
      {
        "en": "Pick up the ordered foods and drive to delivery address",
        "fr":
            "Ramassez les aliments commandés et conduisez à l'adresse de livraison",
        "es":
            "Recoja los alimentos pedidos y conduzca hasta la dirección de entrega.",
        "de":
            "Holen Sie die bestellten Lebensmittel ab und fahren Sie zur Lieferadresse",
        "pt":
            "Pegue os alimentos encomendados e dirija-se ao endereço de entrega",
        "ar": "التقط الأطعمة المطلوبة وتوجه إلى عنوان التسليم",
        "ko": "주문한 음식을 수령하고 배달 주소로 이동"
      } +
      {
        "en": "Delivery",
        "fr": "Livraison",
        "es": "Entrega",
        "de": "Lieferung",
        "pt": "Entrega",
        "ar": "توصيل",
        "ko": "배달"
      } +
      {
        "en":
            "Deliver the ordered food at the delivery address and wait for the next order",
        "fr":
            "Livrer la nourriture commandée à l'adresse de livraison et attendre la prochaine commande",
        "es":
            "Entregue la comida solicitada en la dirección de entrega y espere el próximo pedido",
        "de":
            "Liefern Sie das bestellte Essen an die Lieferadresse und warten Sie auf die nächste Bestellung",
        "pt":
            "Entregue a comida pedida no endereço de entrega e aguarde o próximo pedido",
        "ar": "قم بتوصيل الطعام المطلوب على عنوان التوصيل وانتظر الطلب التالي",
        "ko": "주문한 음식을 배달 주소로 배달하고 다음 주문을 기다립니다."
      };

  String get i18n => localize(this, _t);
}
