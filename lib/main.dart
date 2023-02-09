import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_router/go_router.dart';
import 'package:izzat/app/modules/UnknownRoute/bindings/unknown_route_binding.dart';
import 'package:izzat/app/modules/UnknownRoute/views/unknown_route_view.dart';
import 'package:izzat/app/modules/home/views/home_view.dart';
import 'package:izzat/app/modules/login/views/login_view.dart';
import 'package:izzat/app/routes/app_routes_delegate.dart';
import 'package:izzat/app/routes/auto_routes.dart';
import 'package:izzat/app/shared/auth_prefs.dart';
import 'package:sizer/sizer.dart';
import 'dart:html' as html;

import 'app/routes/app_pages.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureApp();
  AuthPrefs.init();
  // SizeConfig().init(Get.context!);
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        // final autoRoutes = AutoRoutes();
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Izzat store",
          getPages: AppPages.routes,
          defaultTransition: Transition.fade,
          routerDelegate: AppRouterDelegate(),
        );
      },
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.LOGIN,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginView();
          },
        ),
      ],
    ),
  ],
);
