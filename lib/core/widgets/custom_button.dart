import 'package:flutter/material.dart';

import '../basic_features.dart';
import '../utils/custom_text_style.dart';
import 'custom_image.dart';

class RoundedRectangleButton extends ElevatedButton {
  RoundedRectangleButton.textButton({
    super.key,
    required final String text,
    final TextAlign? textAlign,
    final double? miniWidth,
    final double? height,
    final TextStyle? textStyle,
    final double? elevation,
    final double? cornerRadius,
    final Color? btnBgColor,
    final Color? borderColor,
    final EdgeInsetsGeometry? padding,
    required final VoidCallback onPressed,
  })  : assert(
          text.isNotEmpty,
          "Text must not be null",
        ),
        super(
            child: Text(
              text,
              style: textStyle ?? CustomTextStyle.instance.semiBold18,
              textAlign: textAlign,
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize:
                  Size(miniWidth ?? double.infinity, height ?? Dimensions.h60),
              padding: padding,
              // fixedSize:
              // Size(miniWidth ?? double.infinity, height ?? Dimensions.h40),
              backgroundColor: btnBgColor ?? Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(cornerRadius ?? Dimensions.r10),
                  side: BorderSide(color: borderColor ?? Colors.transparent)),
            ));

  RoundedRectangleButton.iconTextButton({
    super.key,
    final String? text,
    required final Widget icon,
    final double? miniWidth,
    final double? height,
    final TextStyle? textStyle,
    final double? elevation,
    final double? cornerRadius,
    final Color? btnBgColor,
    final Color? borderColor,
    required final VoidCallback onPressed,
  }) : super(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(alignment: Alignment.centerLeft, child: icon),
                if (text != null && text.isNotEmpty)
                  Text(
                    text,
                    style: textStyle ?? CustomTextStyle.instance.semiBold18,
                  ),
              ],
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize:
                  Size(miniWidth ?? double.infinity, height ?? Dimensions.h60),
              // fixedSize:
              // Size(miniWidth ?? double.infinity, height ?? Dimensions.h40),
              backgroundColor: btnBgColor ?? Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(cornerRadius ?? Dimensions.r10),
                  side: BorderSide(color: borderColor ?? Colors.transparent)),
            ));
}

class MyButton extends StatelessWidget {
  final double? miniWidth;
  final double? height;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderRadius? borderRadius;
  final String? title;
  final EdgeInsets? padding;
  final bool? loading;
  final double? cornerRadius;
  final Widget? child;
  final Color? btnBgColor;
  final Function()? onPressed;

  const MyButton(
      {super.key,
      this.miniWidth,
      this.padding,
      this.height,
      this.child,
      this.elevation,
      this.cornerRadius,
      this.title,
      this.btnBgColor,
      this.textStyle,
      required this.onPressed,
      this.loading,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: padding,
        fixedSize: Size(miniWidth ?? double.infinity, height ?? Dimensions.h40),
        backgroundColor: btnBgColor ?? AppColors.primaryColor,
        disabledBackgroundColor: AppColors.greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(cornerRadius ?? Dimensions.r12),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: child ??
            Text(title!,
                textAlign: TextAlign.center,
                style: textStyle ??
                    fontStyleMedium17.copyWith(color: Colors.white)),
      ),
    );
  }
}

class MyOutLineButton extends StatelessWidget {
  final double? miniWidth;
  final double? height;
  final double? borderWidth;
  final TextStyle? textStyle;
  final double? elevation;
  final String? title;
  final bool? loading;
  final double? cornerRadius;
  final Color? btnBgColor;
  final Color? borderColor;
  final Function onPressed;

  const MyOutLineButton(
      {super.key,
      this.miniWidth,
      this.borderWidth,
      this.height,
      this.borderColor,
      this.elevation,
      this.cornerRadius,
      required this.title,
      this.btnBgColor,
      this.textStyle,
      required this.onPressed,
      this.loading});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: btnBgColor ?? AppColors.whiteColor,
        fixedSize: Size(miniWidth ?? double.infinity, height ?? Dimensions.h50),
        side: BorderSide(
          width: borderWidth ?? 1.0,
          color: borderColor ?? AppColors.textFieldBorderColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius ?? Dimensions.r10),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Center(
        child: Text(title!, style: textStyle ?? fontStyleSemiBold15),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final String iconAsset;
  final String label;
  final double iconSize;
  final VoidCallback onPressed;
  final bool iconFirst;
  final bool showBorder;
  final Color backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color textColor;

  const AppIconButton({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.onPressed,
    this.showBorder = true,
    this.iconFirst = true,
    this.iconSize = 14.0,
    this.iconColor,
    this.borderColor,
    this.backgroundColor = Colors.transparent,
    this.textColor = AppColors.textGreyColor,
  });

  @override
  Widget build(BuildContext context) {
    final icon = CustomSvgAssetImage(
      image: iconAsset,
      height: iconSize,
      width: iconSize,
      color: iconColor,
    );

    final text = Text(
      label,
      style: fontStyleMedium12.copyWith(color: textColor),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.h16,
          horizontal: Dimensions.w20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.commonRadius),
          side: BorderSide(
              color: showBorder
                  ? AppColors.outlineColor
                  : borderColor ?? AppColors.outlineColor),
        ),
        minimumSize: Size(0, Dimensions.h40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconFirst
            ? [icon, SizedBox(width: Dimensions.w3), text]
            : [text, SizedBox(width: Dimensions.w3), icon],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onPressed;
  final double size;
  final EdgeInsets? padding;
  final String? label;
  final Color? backgroundColor;

  const ActionButton({
    super.key,
    required this.iconAsset,
    required this.onPressed,
    required this.size,
    this.padding,
    this.label,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon = CustomSvgAssetImage(
      image: iconAsset,
      height: size * 0.4,
      width: size * 0.4,
    );

    Widget buttonContent;
    if (label != null) {
      buttonContent = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: Dimensions.w8),
          Text(
            label!,
            style: fontStyleBold13.apply(color: AppColors.whiteColor),
          ),
        ],
      );
    } else {
      buttonContent = icon;
    }

    return SizedBox(
      width: padding != null ? null : size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: label != null
              ? padding ?? EdgeInsets.symmetric(horizontal: Dimensions.w16)
              : EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.commonRadius),
          ),
          elevation: 0,
        ),
        child: buttonContent,
      ),
    );
  }
}
