import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/dimensions.dart';
import '../utils/style.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xff8C74FB),
    splashColor: AppColors.primaryLightColor.withValues(alpha: 0.02),
    highlightColor: AppColors.primaryLightColor.withValues(alpha: 0.2),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light, seedColor: AppColors.primaryColor),
    cardColor: const Color(0xfff9f9f9),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(
            AppColors.primaryColor.withValues(alpha: 0.1)), // Splash effect
        foregroundColor:
            WidgetStatePropertyAll(AppColors.primaryColor), // Icon color
      ),
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    hintColor: AppColors.hintColor,
    canvasColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      color: AppColors.backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: false,
    ),
    tabBarTheme: TabBarThemeData(
      splashFactory: NoSplash.splashFactory,
      overlayColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        // Use the default focused overlay color
        return states.contains(WidgetState.focused) ? null : Colors.transparent;
      }),
    ),
    navigationBarTheme: NavigationBarThemeData(
      iconTheme: WidgetStateProperty.all(const IconThemeData(
        color: Colors.black, // Set the color for your icons here
      )),
      // height: Platform.isIOS ? null : Dimensions.h80,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.containerColor,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: Colors.transparent,
      labelTextStyle:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return fontStyleSemiBold12.apply(
            color: AppColors.backgroundColorDark,
          );
        } else {
          return fontStyleRegular12.copyWith(
            color: AppColors.backgroundColorDark,
          );
        }
      }),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: Dimensions.h3),
        backgroundColor: AppColors.signInModeButtonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.r10)),
        side:
            const BorderSide(color: AppColors.signInModeButtonColor, width: 0),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
                AppColors.primaryLightColor.withValues(alpha: 0.2)))),
    dialogTheme: DialogThemeData(backgroundColor: const Color(0x80000000)),
  );
}
