import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';

class WebToastUtils {
  static OverlayEntry? _currentToast;

  static void show({
    required BuildContext context,
    required String message,
    final bool isSuccess = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    _currentToast?.remove();

    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: Dimensions.h50,
        right: 0,
        child: _ToastCard(
          message: message,
          isSuccess: isSuccess,
        ),
      ),
    );

    overlay.insert(overlayEntry);
    _currentToast = overlayEntry;

    Future.delayed(duration, () {
      overlayEntry.remove();
      if (_currentToast == overlayEntry) _currentToast = null;
    });
  }

  static void showFeatureUnderDevelopment(BuildContext context) {
    show(
      context: context,
      message: "This feature is under development!",
      isSuccess: true,
    );
  }

}

class _ToastCard extends StatefulWidget {
  final String message;
  final bool isSuccess;

  const _ToastCard({
    required this.message,
    this.isSuccess = false,
  });

  @override
  State<_ToastCard> createState() => _ToastCardState();
}

class _ToastCardState extends State<_ToastCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  ));

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.commonRadius),
            bottomLeft: Radius.circular(Dimensions.commonRadius)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.h4)
              .copyWith(left: Dimensions.w6, right: Dimensions.w12),
          decoration: BoxDecoration(
            color: widget.isSuccess
                ? AppColors.greenLightColor
                : AppColors.redLightColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.commonRadius),
                bottomLeft: Radius.circular(Dimensions.commonRadius)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: Dimensions.w4,
            children: [
              CustomSvgAssetImage(
                image: widget.isSuccess
                    ? AppImages.icToastSuccess
                    : AppImages.icToastFail,
                size: Dimensions.w14,
              ),
              Text(widget.message,
                  style: fontStyleRegular14.apply(
                      color: widget.isSuccess
                          ? AppColors.greenColor
                          : AppColors.redColor)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
