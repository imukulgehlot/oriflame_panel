import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../basic_features.dart';
import '../helpers/animation_helper.dart';
import '../widgets/custom_image.dart';
import 'logger_util.dart';

Future<void> orientations() async =>
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

class AppUtils {
  static InputFormatter inputFormatter = InputFormatter();
  static RegExpression regExpression = RegExpression();
  static String packageName = '';

  static double bottomPadding(BuildContext context) =>
      buttonHeight(context) + MediaQuery.of(context).padding.bottom;

  static double buttonHeight(BuildContext context) {
    // print("AppBar().preferredSize.height    ${AppBar().preferredSize.height}");
    return AppBar().preferredSize.height;
  }

  static String? deviceID;
  static bool isAndroid = Platform.isAndroid;
  static bool isIos = Platform.isIOS;

  static String platform = Platform.isAndroid ? "Android" : "iOS";

  static String formatDateTimeToDayMonthYearTime(DateTime dateTime) {
    // Define the desired date and time format

    final DateFormat customFormat = DateFormat('d MMM yyyy, h:mm a');

    // Format the DateTime accordingly
    String formattedDateTime = customFormat.format(dateTime);

    return formattedDateTime;
  }

  static String formatDateTimeToDayMonthYear(DateTime dateTime,
      {String separator = ' '}) {
    // Define the desired date and time format

    final DateFormat customFormat =
        DateFormat('d${separator}MMM${separator}yyyy');

    // Format the DateTime accordingly
    String formattedDateTime = customFormat.format(dateTime);

    return formattedDateTime;
  }

  static String getDuration(Duration duration) {
    final int hours = duration.inHours.toString().length;
    return duration.inHours > 0
        ? hours == 1
            ? duration.toString().substring(0, 7)
            : duration.toString().substring(0, 8)
        : duration.toString().substring(2, 7);
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static Pattern phonePattern = r'(^[0-9 ]*$)';

  static void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    }
    exit(0);
  }

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


  static Future<void> openLink({required String link}) async {
    final Uri encodedURl = Uri.parse(link);

    try {
      await launchUrl(encodedURl, mode: LaunchMode.inAppWebView);
    } catch (e) {
      logger.e('Error launching URL: $e');
    }
  }



  static showToast(val,[Color? bgColor]) => Fluttertoast.showToast(
      msg: val,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP_RIGHT,
      webBgColor: bgColor ?? AppColors.snackBarBackgroundColor,

      backgroundColor: AppColors.blackColor,
      textColor: Colors.white,
      fontSize: 16.0);

  static Future<void> openUrl({required String url, Uri? uri}) async {
    try {
      bool launched = await launchUrl(uri ?? Uri.parse(url),
          mode: LaunchMode
              .externalNonBrowserApplication); // Launch the app if installed!

      if (!launched) {
        launchUrl(Uri.parse(url)); // Launch web view if app is not installed!
      }
    } catch (e) {
      launchUrl(
        Uri.parse(url),
      ); // Launch web view if app is not installed!
    }
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
