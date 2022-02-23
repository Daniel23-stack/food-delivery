import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Earning",
        "fr": "Revenus",
        "es": "Ganador",
        "de": "Verdienen",
        "pt": "Ganho",
        "ar": "كسب",
        "ko": "적립"
      } +
      {
        "en": "Select your preferred language",
        "fr": "Sélectionnez votre langue préférée",
        "es": "Seleccione su idioma preferido",
        "de": "Wählen Sie Ihre bevorzugte Sprache",
        "pt": "Selecione seu idioma preferido",
        "ar": "اختر لغتك المفضلة",
        "ko": "선호하는 언어를 선택하십시오"
      } +
      {
        "en": "Update Details",
        "fr": "Mettre à jour les détails",
        "es": "Detalles de actualización",
        "de": "Details aktualisieren",
        "pt": "Detalhes de atualização",
        "ar": "تحديث التفاصيل",
        "ko": "세부 정보 업데이트"
      } +
      {
        "en": "Change Password",
        "fr": "Changer le mot de passe",
        "es": "Cambiar la contraseña",
        "de": "Kennwort ändern",
        "pt": "Alterar a senha",
        "ar": "تغيير كلمة المرور",
        "ko": "비밀번호 변경"
      } +
      {
        "en": "Notifications",
        "fr": "Notifications",
        "es": "Notificaciones",
        "de": "Benachrichtigungen",
        "pt": "Notificações",
        "ar": "إشعارات",
        "ko": "알림"
      } +
      {
        "en": "Language",
        "fr": "Langue",
        "es": "Idioma",
        "de": "Sprache",
        "pt": "Língua",
        "ar": "لغة",
        "ko": "언어"
      } +
      {
        "en": "FAQ's & Support",
        "fr": "FAQ et assistance",
        "es": "Preguntas frecuentes y soporte",
        "de": "FAQs & Support",
        "pt": "Perguntas frequentes e suporte",
        "ar": "التعليمات والدعم",
        "ko": "FAQ 및 지원"
      } +
      {
        "en": "Logout",
        "fr": "Se déconnecter",
        "es": "Cerrar sesión",
        "de": "Ausloggen",
        "pt": "Sair",
        "ar": "تسجيل خروج",
        "ko": "로그 아웃"
      } +
      {
        "en": "Current Earning",
        "fr": "Gains actuels",
        "es": "Ganancia actual",
        "de": "Aktuelles Einkommen",
        "pt": "Ganhos atuais",
        "ar": "الكسب الحالي",
        "ko": "현재 수입"
      } +
      {
        "en": "Notifications",
        "fr": "Notifications",
        "es": "Notificaciones",
        "de": "Benachrichtigungen",
        "pt": "Notificações",
        "ar": "إشعارات",
        "ko": "알림"
      } +
      {
        "en": "Oops! No notifications",
        "fr": "Oops! Aucune notification",
        "es": "¡UPS! No Notificaciones",
        "de": "Hoppla! Keine Benachrichtigungen",
        "pt": "Ops! Nenhuma notificação",
        "ar": "وجه الفتاة! لا إشعارات",
        "ko": "이런! 알림 없음"
      } +
      {
        "en": "When you get notifications, they will show up here.",
        "fr": "Lorsque vous recevez des notifications, elles s'affichent ici.",
        "es": "Cuando reciba notificaciones, aparecerán aquí.",
        "de":
            "Wenn Sie Benachrichtigungen erhalten, werden diese hier angezeigt.",
        "pt": "Quando você receber notificações, elas aparecerão aqui.",
        "ar": "عندما تتلقى إشعارات ، ستظهر هنا.",
        "ko": "알림을 받으면 여기에 표시됩니다."
      } +
      {
        "en": "Change Password",
        "fr": "Changer le mot de passe",
        "es": "Cambiar la contraseña",
        "de": "Kennwort ändern",
        "pt": "Alterar a senha",
        "ar": "تغيير كلمة المرور",
        "ko": "비밀번호 변경"
      } +
      {
        "en": "Current Password",
        "fr": "Mot de passe actuel",
        "es": "Contraseña actual",
        "de": "Jetziges Passwort",
        "pt": "Senha atual",
        "ar": "كلمة السر الحالية",
        "ko": "현재 비밀번호"
      } +
      {
        "en": "New Password",
        "fr": "nouveau mot de passe",
        "es": "Nueva contraseña",
        "de": "Neues Kennwort",
        "pt": "Nova Senha",
        "ar": "كلمة السر الجديدة",
        "ko": "새 비밀번호"
      } +
      {
        "en": "Confirm New Password",
        "fr": "Confirmer le nouveau mot de passe",
        "es": "Confirmar nueva contraseña",
        "de": "Bestätige neues Passwort",
        "pt": "Confirme a nova senha",
        "ar": "تأكيد كلمة المرور الجديدة",
        "ko": "새 암호를 확인합니다"
      } +
      {
        "en": "Edit Profile",
        "fr": "Editer le profil",
        "es": "Editar perfil",
        "de": "Profil bearbeiten",
        "pt": "Editar Perfil",
        "ar": "تعديل الملف الشخصي",
        "ko": "프로필 수정"
      } +
      {
        "en": "Change Photo",
        "fr": "Changer la photo",
        "es": "Cambiar foto",
        "de": "Foto ändern",
        "pt": "Mudar foto",
        "ar": "غير الصوره",
        "ko": "사진 변경"
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
        "en": "Email",
        "fr": "E-mail",
        "es": "Correo electrónico",
        "de": "Email",
        "pt": "E-mail",
        "ar": "بريد إلكتروني",
        "ko": "이메일"
      } +
      {
        "en": "Phone Number",
        "fr": "Numéro de téléphone",
        "es": "Número de teléfono",
        "de": "Telefonnummer",
        "pt": "Número de telefone",
        "ar": "رقم الهاتف",
        "ko": "전화 번호"
      } +
      {
        "en": "Update",
        "fr": "Mettre à jour",
        "es": "Actualizar",
        "de": "Aktualisieren",
        "pt": "Atualizar",
        "ar": "تحديث",
        "ko": "최신 정보"
      };

  String get i18n => localize(this, _t);
}
