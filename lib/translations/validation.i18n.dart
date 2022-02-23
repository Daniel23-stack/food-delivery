import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations("en") +
      {
        "en": "Please enter a valid name",
        "fr": "Merci d'entrer un nom valide",
        "es": "Por favor ingrese un nombre valido",
        "de": "Bitte geben Sie einen gültigen Namen ein",
        "pt": "Por favor, indique um nome válido",
        "ar": "رجاء ادخل اسما صحيحا",
        "ko": "유효한 이름을 입력하십시오"
      } +
      {
        "en": "Please enter a valid email address",
        "fr": "S'il vous plaît, mettez une adresse email valide",
        "es": "Por favor, introduce una dirección de correo electrónico válida",
        "de": "Bitte geben Sie eine gültige E-Mail-Adresse ein",
        "pt": "Por favor insira um endereço de e-mail válido",
        "ar": "يرجى إدخال عنوان بريد إلكتروني صالح",
        "ko": "유효한 이메일 주소를 입력하세요"
      } +
      {
        "en": "Please enter a valid phone number",
        "fr": "s'il vous plaît entrer un numéro de téléphone valide",
        "es": "Por favor ingrese un número de teléfono válido",
        "de": "Bitte geben Sie eine gültige Telefonnummer ein",
        "pt": "Por favor insira um número de telefone válido",
        "ar": "يرجى إدخال رقم هاتف صالح",
        "ko": "유효한 전화 번호를 입력하세요"
      } +
      {
        "en":
            "Paasword must contain at least one(1) upper case and min 6 characters",
        "fr":
            "Paasword doit contenir au moins une (1) majuscule et au moins 6 caractères",
        "es":
            "La palabra clave debe contener al menos una (1) mayúscula y un mínimo de 6 caracteres",
        "de":
            "Paasword muss mindestens einen (1) Großbuchstaben und mindestens 6 Zeichen enthalten",
        "pt":
            "Paasword deve conter pelo menos uma (1) maiúscula e no mínimo 6 caracteres",
        "ar":
            "يجب أن يحتوي Paasword على حرف واحد كبير (1) واحد على الأقل و 6 أحرف على الأقل",
        "ko": "Paasword에는 최소 1 개의 대문자와 최소 6 개의 문자가 포함되어야합니다."
      } +
      {
        "en": "Please enter a valid name",
        "fr": "Merci d'entrer un nom valide",
        "es": "Por favor ingrese un nombre valido",
        "de": "Bitte geben Sie einen gültigen Namen ein",
        "pt": "Por favor, indique um nome válido",
        "ar": "رجاء ادخل اسما صحيحا",
        "ko": "유효한 이름을 입력하십시오"
      } +
      {
        "en": "Password doesn't match",
        "fr": "Le mot de passe ne correspond pas",
        "es": "La contraseña no coincide",
        "de": "Passwort stimmt nicht überein",
        "pt": "Senha não coincide",
        "ar": "كلمة المرور غير متطابقة",
        "ko": "비밀번호가 일치하지 않습니다"
      };

  String get i18n => localize(this, _t);
}
