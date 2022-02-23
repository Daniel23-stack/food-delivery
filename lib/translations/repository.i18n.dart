import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Login Successful!",
        "fr": "Connexion réussie!",
        "es": "¡Inicio de sesión correcto!",
        "de": "Anmeldung erfolgreich!",
        "pt": "Login bem-sucedido!",
        "ar": "تم تسجيل الدخول بنجاح!",
        "ko": "성공적 로그인!"
      } +
      {
        "en": "Login Failed!",
        "fr": "Échec de la connexion!",
        "es": "¡Error de inicio de sesion!",
        "de": "Fehler bei der Anmeldung!",
        "pt": "Falha no login!",
        "ar": "فشل عملية الدخول!",
        "ko": "로그인 실패!"
      } +
      {
        "en": "Password Reset",
        "fr": "Réinitialisation du mot de passe",
        "es": "Restablecimiento de contraseña",
        "de": "Passwort zurücksetzen",
        "pt": "Redefinição de senha",
        "ar": "إعادة تعيين كلمة المرور",
        "ko": "비밀번호 초기화"
      } +
      {
        "en": "Password Reset Failed!",
        "fr": "La réinitialisation du mot de passe a échoué!",
        "es": "Error al restablecer la contraseña!",
        "de": "Zurücksetzen des Passworts fehlgeschlagen!",
        "pt": "Falha ao redefinir a senha!",
        "ar": "فشل إعادة تعيين كلمة المرور!",
        "ko": "비밀번호 재설정 실패!"
      } +
      {
        "en": "Profile Update",
        "fr": "Mise à jour du profil",
        "es": "Actualización de perfil",
        "de": "Profilaktualisierung",
        "pt": "Atualização de Perfil",
        "ar": "تحديث الملف الشخصي",
        "ko": "프로필 업데이트"
      } +
      {
        "en": "Profile Update Failed!",
        "fr": "La mise à jour du profil a échoué!",
        "es": "¡Error al actualizar el perfil!",
        "de": "Profilaktualisierung fehlgeschlagen!",
        "pt": "A atualização do perfil falhou!",
        "ar": "فشل تحديث الملف الشخصي!",
        "ko": "프로필 업데이트 실패!"
      } +
      {
        "en": "Password Update",
        "fr": "Mise à jour du mot de passe",
        "es": "Actualización de contraseña",
        "de": "Passwort aktualisieren",
        "pt": "Atualização de senha",
        "ar": "تحديث كلمة المرور",
        "ko": "비밀번호 업데이트"
      } +
      {
        "en": "Password Update Failed!",
        "fr": "La mise à jour du mot de passe a échoué!",
        "es": "¡Error al actualizar la contraseña!",
        "de": "Passwort-Update fehlgeschlagen!",
        "pt": "Falha ao atualizar a senha!",
        "ar": "فشل تحديث كلمة المرور!",
        "ko": "비밀번호 업데이트 실패!"
      } +
      {
        "en": "Status Updated",
        "fr": "Statut mis à jour",
        "es": "Estado actualizado",
        "de": "Status aktualisiert",
        "pt": "Status Atualizado",
        "ar": "تم تحديث الحالة",
        "ko": "상태 업데이트"
      } +
      {
        "en": "Status Updated Failed",
        "fr": "Échec de la mise à jour du statut",
        "es": "Estado actualizado fallido",
        "de": "Status aktualisiert fehlgeschlagen",
        "pt": "Falha ao atualizar o status",
        "ar": "فشل تحديث الحالة",
        "ko": "상태 업데이트 실패"
      };

  String get i18n => localize(this, _t);
}
