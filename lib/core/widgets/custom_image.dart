import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oriflame_panel/core/theme/color_scheme_extension.dart';

import '../basic_features.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final String image;
  final BoxFit? fitType;
  final bool showAppLogoInErrorWidget;
  final bool showBackground;

  const CustomNetworkImage(
      {super.key,
      this.height,
      this.width,
      this.borderRadius,
      required this.image,
      this.fitType,
      this.showBackground = false,
      this.showAppLogoInErrorWidget = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
          fit: fitType ?? BoxFit.cover,
          imageUrl: image,
          placeholder: (context, url) => showBackground
              ? Container(
                  decoration: BoxDecoration(
                      color: AppColors.dateContainer.withValues(
                          alpha: Get.theme.brightness == Brightness.light
                              ? 0.05
                              : 0.2)),
                  height: height,
                  width: width ?? double.infinity,
                  child: const Center(
                      child: CupertinoActivityIndicator(
                    radius: 10,
                  )),
                )
              : const Center(
                  child: CupertinoActivityIndicator(
                  radius: 10,
                )),
          errorWidget: (context, url, error) => Container(
                color: AppColors.greyColor,
                child: showAppLogoInErrorWidget
                    ? Padding(
                        padding: EdgeInsets.all(Dimensions.w20),
                        child: Image.asset(
                          AppImages.icAppLogo,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.r35,
                            vertical: Dimensions.r33),
                        child: Image.asset(
                          AppImages.noConnection,
                          fit: BoxFit.fill,
                        ),
                      ),
              )),
    );
  }
}

class CustomSvgAssetImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? size;
  final bool isSVGString;
  final Function? onTap;
  final String image;
  final Color? color;

  const CustomSvgAssetImage({
    super.key,
    this.height,
    this.width,
    this.size,
    this.onTap,
    this.color,
    required this.image,
    this.isSVGString = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap?.call() : null,
      child: isSVGString
          ? SvgPicture.string(
              image,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              fit: BoxFit.contain,
              height: height,
              width: width,
            )
          : SvgPicture.asset(
              image,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
              fit: BoxFit.contain,
              height: size ?? height,
              width: size ?? width,
            ),
    );
  }
}

class CustomAssetImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? size;
  final Color? imageColor;
  final BoxFit? fit;
  final Function? onTap;
  final String image;

  const CustomAssetImage({
    super.key,
    this.height,
    this.size,
    this.width,
    this.fit,
    this.imageColor,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null ? () => onTap?.call() : null,
      child: Image.asset(
        image,
        fit: fit ?? BoxFit.cover,
        height: size ?? height,
        width: size ?? width,
        color: imageColor,
      ),
    );
  }
}

class CustomRoundCornerNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final String image;
  final String? nameForInitials;

  const CustomRoundCornerNetworkImage({
    super.key,
    this.height,
    this.width,
    this.radius = 10,
    this.nameForInitials,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: image.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Center(
                child: CupertinoActivityIndicator(
                  color: AppColors.primaryColor,
                  radius: 10,
                ),
              ),
              errorWidget: (context, url, error) {
                return CircleAvatar(
                  radius: radius,
                  backgroundColor: AppColors.primaryColor,
                  child: Center(
                    child: Text(
                      AppUtils.getInitials(nameForInitials ?? ''),
                      style: fontStyleSemiBold14.apply(
                        color: Get.theme.colorScheme.hintTextColor
                            .withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                );
              },
              imageBuilder: (context, provider) {
                return Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.outlineColor,
                      width: Dimensions.w2,
                    ),
                    image: DecorationImage(
                      image: provider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            )
          : CircleAvatar(
              radius: radius,
              backgroundColor: Get.theme.colorScheme.textFieldColor,
              foregroundColor: Get.theme.colorScheme.textFieldColor,
              child: Center(
                child: Text(
                  AppUtils.getInitials(nameForInitials ?? ''),
                  style: fontStyleSemiBold14.apply(
                      color: Get.theme.colorScheme.hintTextColor
                          .withValues(alpha: 0.8)),
                ),
              ),
            ),
    );
  }
}
