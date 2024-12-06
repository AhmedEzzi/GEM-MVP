import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gem_mvp/router/router.gr.dart';

final router = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter([
    GlobalKey<NavigatorState>? navigationKey,
  ]) : super(navigatorKey: navigationKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),

        // Auth Pages
      ];
}
