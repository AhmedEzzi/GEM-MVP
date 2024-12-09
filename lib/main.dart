import 'package:device_preview/device_preview.dart';
import 'package:easy_logger/easy_logger.dart';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:gem_mvp/app.dart';
import 'package:gem_mvp/env.dart';
import 'package:gem_mvp/generated/codegen_loader.g.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'generated/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Initialize EasyLocalization and log errors if any

  // Initialize the Appwrite client

  // Set the preferred device orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set up EasyLocalization logger level
  EasyLocalization.logger.enableLevels = [
    LevelMessages.warning
  ]; // Only log warnings

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Initialize Sentry for error tracking
  await SentryFlutter.init(
    (options) {
      options.dsn = kSentryDSN;
      options.tracesSampleRate = 1.0;
      options.captureFailedRequests = true;
    },
    appRunner: () => runApp(
      EasyLocalization(
        supportedLocales: const [arabicLocale, englishLocale],
        path: 'assets/translations',
        fallbackLocale: englishLocale,
        startLocale: englishLocale,
        assetLoader: const CodegenLoader(),
        child: DevicePreview(
          enabled:
              false, // Set to false or true based on whether you want DevicePreview
          builder: (context) {
            return const GemMvpApp();
          },
        ),
      ),
    ),
  );
}
