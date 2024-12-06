import 'dart:async';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'package:easy_localization/easy_localization.dart';

// export 'codegen_loader.g.dart';
// export 'locale_keys.g.dart';

const arabicLocale = Locale('ar');
const englishLocale = Locale('en');

extension LocalizationUtils on BuildContext {
  bool get isArabic => locale == arabicLocale;
  bool get isEnglish => locale == englishLocale;

  static String languageKey = "__LANGUAGE_KEY__";

  Future<void> changeLanguage(Locale local) async {
    final prefs = await SharedPreferences.getInstance();
    await setLocale(local);
    unawaited(prefs.setString(languageKey, local.languageCode));
    await WidgetsBinding.instance.reassembleApplication();
  }

  Future<void> initLocalization() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(languageKey);
    if (languageCode == null) return;
    final locale = Locale(languageCode);
    await setLocale(locale);
  }

  ui.TextDirection get textDirection {
    if (isArabic) return ui.TextDirection.rtl;
    return ui.TextDirection.ltr;
  }
}
