import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:gem_mvp/generated/localization.dart';
import 'package:gem_mvp/router/router.dart';

class GemMvpApp extends StatefulWidget {
  const GemMvpApp({super.key});

  @override
  State<GemMvpApp> createState() => _GemMvpAppState();
}

class _GemMvpAppState extends State<GemMvpApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GEM MVP',
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates
        ..add(
          FormBuilderLocalizations.delegate,
        ),
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
