// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "start" : "البداية",
    "next" : "التالى",
    "finish" : "النهاية",
    "skip": "تخطى",
    "search" :"البحث",
    "login" : "تسجيل",
    "transform" : "غير",
    "yourBody" : "جسمك",
    "yourLifeWithOurGymApp" : "حياتك مع تطبيقنا الرياضي",
    "emailOrPhone" : "الايميل او الهاتف",
    "validateEmailOrPhone" : "برجاء التاكد من رقم الهاتف او الايميل",
    "password" : "كلمة السر",
    "validatePassword" : "يرجى التحقق من كلمة السر",
    "forgetPassword" : "نسيت كلمة المرور",
    "doNotHaveAnAccount" : "ليس لديك حساب ؟",
    "register" : "سجل الان",
  };
  static const Map<String, dynamic> en = {
    "register" : "Register",
    "forgetPassword" : "Forget Password",
    "doNotHaveAnAccount" : "Don’t have an account ?",
    "password" : "Password",
    "emailOrPhone" : "Email OR Phone",
    "validateEmailOrPhone" : "Please verify your phone number or email",
    "validatePassword" : "Please verify your Password" ,
    "yourLifeWithOurGymApp" : "Your Life With Our Gym App",
    "transform" : "Transform",
    "yourBody" : "Your Body",
    "start" : "Start",
    "next" : "Next",
    "finish" : "Finish",
    "login" : "Login" ,

  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
