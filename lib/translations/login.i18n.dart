import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Login",
        "fr": "Connexion",
        "es": "Acceso",
        "de": "Anmeldung",
        "pt": "Conecte-se",
        "ar": "تسجيل الدخول",
        "ko": "로그인"
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
        "en": "Password",
        "fr": "Mot de passe",
        "es": "Contraseña",
        "de": "Passwort",
        "pt": "Senha",
        "ar": "كلمه السر",
        "ko": "암호"
      } +
      {
        "en": "Forgot Password?",
        "fr": "Mot de passe oublié?",
        "es": "¿Has olvidado tu contraseña?",
        "de": "Passwort vergessen?",
        "pt": "Esqueceu a senha?",
        "ar": "هل نسيت كلمة السر؟",
        "ko": "비밀번호를 잊으 셨나요?"
      };

  String get i18n => localize(this, _t);
}
