import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oriflame_panel/core/utils/app_router.dart';

import '../core/basic_features.dart';
import '../core/theme/app_theme_data.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final goRouter = AppRouter.router;

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(1440, 1024),
        builder: (_, widget) => MaterialApp.router(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          ),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown
            },
          ),
          routeInformationParser: goRouter.routeInformationParser,
          routerDelegate: goRouter.routerDelegate,
          routeInformationProvider: goRouter.routeInformationProvider,
          theme: AppThemeData.lightTheme,
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
        ),
      );
}
