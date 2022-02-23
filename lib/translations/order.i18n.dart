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
        "en": "pull up load",
        "fr": "tirer la charge",
        "es": "levantar la carga",
        "de": "Last hochziehen",
        "pt": "puxar a carga",
        "ar": "سحب ما يصل الحمل",
        "ko": "짐을 끌어 올리다"
      } +
      {
        "en": "Load Failed!Click retry!",
        "fr": "Échec du chargement! Cliquez sur Réessayer!",
        "es": "Error de carga. Haga clic en reintentar.",
        "de": "Laden fehlgeschlagen! Klicken Sie auf Wiederholen!",
        "pt": "Falha ao carregar! Clique em repetir!",
        "ar": "فشل التحميل! انقر فوق إعادة المحاولة!",
        "ko": "로드 실패! 다시 시도를 클릭하십시오!"
      } +
      {
        "en": "release to load more",
        "fr": "relâchez pour charger plus",
        "es": "suelte para cargar más",
        "de": "loslassen, um mehr zu laden",
        "pt": "solte para carregar mais",
        "ar": "الافراج لتحميل المزيد",
        "ko": "더로드하려면 놓으세요."
      } +
      {
        "en": "No more Data",
        "fr": "Plus de données",
        "es": "No más datos",
        "de": "Keine Daten mehr",
        "pt": "Não há mais dados",
        "ar": "لا مزيد من البيانات",
        "ko": "더 이상 데이터 없음"
      } +
      {
        "en": "Oops! No orders to see",
        "fr": "Oops! Aucune commande à voir",
        "es": "¡UPS! No hay órdenes para ver",
        "de": "Hoppla! Keine Bestellungen zu sehen",
        "pt": "Ops! Sem ordens para ver",
        "ar": "وجه الفتاة! لا توجد أوامر لرؤيتها",
        "ko": "이런! 볼 명령 없음"
      } +
      {
        "en": "Looks like you haven't been assigned to any order yet",
        "fr": "Il semble que vous n’ayez pas encore été affecté à une commande",
        "es": "Parece que aún no se le asignó ningún pedido.",
        "de":
            "Sieht so aus, als wären Sie noch keiner Bestellung zugeordnet worden",
        "pt": "Parece que você ainda não foi atribuído a nenhum pedido",
        "ar": "يبدو أنه لم يتم تعيينك لأي طلب حتى الآن",
        "ko": "아직 주문에 할당되지 않은 것 같습니다."
      } +
      {
        "en": "Order Details",
        "fr": "détails de la commande",
        "es": "Detalles del pedido",
        "de": "Bestelldetails",
        "pt": "detalhes do pedido",
        "ar": "تفاصيل الطلب",
        "ko": "주문 정보"
      } +
      {
        "en": "Chat with Customer",
        "fr": "Discuter avec le client",
        "es": "Chatear con el cliente",
        "de": "Chatten Sie mit dem Kunden",
        "pt": "Converse com o cliente",
        "ar": "الدردشة مع العملاء",
        "ko": "고객과 채팅"
      } +
      {
        "en": "Chat with Vendor",
        "fr": "Discuter avec le fournisseur",
        "es": "Chatear con el vendedor",
        "de": "Chatten Sie mit dem Anbieter",
        "pt": "Converse com o fornecedor",
        "ar": "الدردشة مع البائع",
        "ko": "공급 업체와 채팅"
      } +
      {
        "en": "Complete Order",
        "fr": "Complétez la commande",
        "es": "Orden completa",
        "de": "Bestellung abschließen",
        "pt": "Ordem completa",
        "ar": "اكمل الطلب",
        "ko": "주문 완료"
      } +
      {
        "en": "Order Code",
        "fr": "Code de commande",
        "es": "Código de orden",
        "de": "Bestellcode",
        "pt": "Código de encomenda",
        "ar": "رمز الطلب",
        "ko": "주문 코드"
      } +
      {
        "en": "Payment Option",
        "fr": "Modalité de paiement",
        "es": "Opcion de pago",
        "de": "Bezahlmöglichkeit",
        "pt": "Opção de pagamento",
        "ar": "خيار الدفع",
        "ko": "지불 옵션"
      } +
      {
        "en": "Order Date",
        "fr": "Date de commande",
        "es": "Fecha de orden",
        "de": "Bestelldatum",
        "pt": "Data do pedido",
        "ar": "تاريخ الطلب",
        "ko": "주문 날짜"
      } +
      {
        "en": "Ordered Food",
        "fr": "Nourriture commandée",
        "es": "Comida ordenada",
        "de": "Bestelltes Essen",
        "pt": "Comida pedida",
        "ar": "طلب الطعام",
        "ko": "주문한 음식"
      } +
      {
        "en": "Customer Info",
        "fr": "informations concernant le client",
        "es": "Información del cliente",
        "de": "Kundeninformation",
        "pt": "Informação do Cliente",
        "ar": "معلومات العميل",
        "ko": "고객 정보"
      } +
      {
        "en": "Phone",
        "fr": "Téléphoner",
        "es": "Teléfono",
        "de": "Telefon",
        "pt": "Telefone",
        "ar": "هاتف",
        "ko": "전화"
      } +
      {
        "en": "Empty",
        "fr": "Vider",
        "es": "Vacío",
        "de": "Leer",
        "pt": "Vazio",
        "ar": "فارغة",
        "ko": "빈"
      } +
      {
        "en": "Name",
        "fr": "Nom",
        "es": "Nombre",
        "de": "Name",
        "pt": "Nome",
        "ar": "اسم",
        "ko": "이름"
      } +
      {
        "en": "Delivery Address",
        "fr": "Adresse de livraison",
        "es": "Dirección de entrega",
        "de": "Lieferadresse",
        "pt": "Endereço de entrega",
        "ar": "عنوان التسليم",
        "ko": "배달 주소"
      } +
      {
        "en": "Vendor Address",
        "fr": "Adresse du fournisseur",
        "es": "Dirección del vendedor",
        "de": "Lieferantenadresse",
        "pt": "Endereço do Vendedor",
        "ar": "عنوان البائع",
        "ko": "공급 업체 주소"
      } +
      {
        "en": "Subtotal",
        "fr": "Total",
        "es": "Total parcial",
        "de": "Zwischensumme",
        "pt": "Subtotal",
        "ar": "المجموع الفرعي",
        "ko": "소계"
      } +
      {
        "en": "Delivery Fee",
        "fr": "Frais de livraison",
        "es": "Gastos de envío",
        "de": "Liefergebühr",
        "pt": "Taxa de entrega",
        "ar": "رسوم التوصيل",
        "ko": "배달비"
      } +
      {
        "en": "Total",
        "fr": "Le total",
        "es": "Total",
        "de": "Gesamt",
        "pt": "Total",
        "ar": "مجموع",
        "ko": "합계"
      } +
      {
        "en": "Orders History",
        "fr": "Historique des commandes",
        "es": "Historial de pedidos",
        "de": "Bestellhistorie",
        "pt": "Histórico de Pedidos",
        "ar": "تاريخ الطلبات",
        "ko": "주문 내역"
      } +
      {
        "en": "pending",
        "fr": "en attendant",
        "es": "pendiente",
        "de": "steht aus",
        "pt": "pendente",
        "ar": "ريثما",
        "ko": "보류 중"
      } +
      {
        "en": "preparing",
        "fr": "en train de préparer",
        "es": "preparando",
        "de": "vorbereiten",
        "pt": "preparando",
        "ar": "خطة",
        "ko": "준비"
      } +
      {
        "en": "ready",
        "fr": "prêt",
        "es": "Listo",
        "de": "bereit",
        "pt": "pronto",
        "ar": "جاهز",
        "ko": "준비된"
      } +
      {
        "en": "enroute",
        "fr": "en route",
        "es": "en camino",
        "de": "unterwegs",
        "pt": "a caminho",
        "ar": "في المسار",
        "ko": "도중에"
      } +
      {
        "en": "delivered",
        "fr": "livré",
        "es": "entregado",
        "de": "geliefert",
        "pt": "entregue",
        "ar": "تم التوصيل",
        "ko": "배달"
      } +
      {
        "en": "failed",
        "fr": "manqué",
        "es": "ha fallado",
        "de": "gescheitert",
        "pt": "fracassado",
        "ar": "باءت بالفشل",
        "ko": "실패한"
      } +
      {
        "en": "cancelled",
        "fr": "annulé",
        "es": "cancelado",
        "de": "abgesagt",
        "pt": "cancelado",
        "ar": "ألغيت",
        "ko": "취소 된"
      } +
      {
        "en": "Foods",
        "fr": "nourriture",
        "es": "Alimentos",
        "de": "Lebensmittel",
        "pt": "Alimentos",
        "ar": "أغذية",
        "ko": "음식"
      } +
      {
        "en": "New Order Alert",
        "fr": "Nouvelle alerte de commande",
        "es": "Alerta de nuevo pedido",
        "de": "New Order Alert",
        "pt": "Alerta de novo pedido",
        "ar": "تنبيه طلب جديد",
        "ko": "새로운 주문 알림"
      } +
      {
        "en": "From",
        "fr": "De",
        "es": "De",
        "de": "Von",
        "pt": "A partir de",
        "ar": "من عند",
        "ko": "에서"
      } +
      {
        "en": "To",
        "fr": "À",
        "es": "A",
        "de": "Zu",
        "pt": "Para",
        "ar": "ل",
        "ko": "에"
      } +
      {
        "en": "Amount",
        "fr": "Montant",
        "es": "Monto",
        "de": "Menge",
        "pt": "Resultar",
        "ar": "كمية",
        "ko": "양"
      } +
      {
        "en": "SWIPE TO ACCEPT",
        "fr": "FAIRE GLISSER POUR ACCEPTER",
        "es": "DESLIZA PARA ACEPTAR",
        "de": "WISCHEN, UM ZU AKZEPTIEREN",
        "pt": "DESLIZE PARA ACEITAR",
        "ar": "مرر سريعًا للقبول",
        "ko": "수락하려면 스 와이프"
      };

  String get i18n => localize(this, _t);
}
