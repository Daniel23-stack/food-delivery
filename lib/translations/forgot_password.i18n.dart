import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Forgot Password",
        "fr": "Mot de passe oublié",
        "es": "Has olvidado tu contraseña",
        "de": "Passwort vergessen",
        "pt": "Esqueceu a senha",
        "ar": "هل نسيت كلمة السر",
        "ko": "비밀번호를 잊으 셨나요"
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
        "en": "Submit",
        "fr": "Soumettre",
        "es": "Enviar",
        "de": "einreichen",
        "pt": "Enviar",
        "ar": "إرسال",
        "ko": "제출"
      };

  String get i18n => localize(this, _t);
}
