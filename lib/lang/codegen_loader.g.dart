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

  };
  static const Map<String, dynamic> en = {
    "start" : "Start",
    "next" : "Next",
    "finish" : "Finish",
    "" : "" ,

  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
