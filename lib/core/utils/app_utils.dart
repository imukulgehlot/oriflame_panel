import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../basic_features.dart';

Future<void> orientations() async =>
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

class AppUtils {
  static InputFormatter inputFormatter = InputFormatter();
  static RegExpression regExpression = RegExpression();


  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static String formatJoinedDate(DateTime? date) {
    if (date == null) return '';
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final day = date.day.toString().padLeft(2, '0');
    final month = months[date.month - 1];
    final year = date.year;

    return '$day $month, $year';
  }



  static Color getRandomColor({bool dark = false}) {
    final Random random = Random();
    const int maxColorValue = 255;

    int randomColorComponent() => random.nextInt(maxColorValue);

    int randomRed = randomColorComponent();
    int randomGreen = randomColorComponent();
    int randomBlue = randomColorComponent();

    return dark
        ? Color.fromARGB(255, randomRed, randomGreen, randomBlue)
            .withValues(alpha: 0.35)
        : Color.fromARGB(255, randomRed, randomGreen, randomBlue);
  }


  // Get 2 initials
  static String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join().toUpperCase()
      : '';
}

class InputFormatter {
  FilteringTextInputFormatter get number =>
      FilteringTextInputFormatter.allow(RegExp(r"[0-9]"));
}

class RegExpression {
  RegExp phonePattern = RegExp(r'(^[0-9 ]*$)');
}

class FontAsset {
  static const String satoshi = "Satoshi";

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class MyDivider extends StatelessWidget {
  final double height;
  final Color? color;

  const MyDivider({super.key, this.height = 0, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
        height: height, color: color ?? AppColors.disabledButtonColor);
  }
}

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: Dimensions.h2),
      child: VerticalDivider(
        thickness: 0.5,
        color: AppColors.outlineColor,
      ),
    );
  }
}

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() => _timer?.cancel();
}
