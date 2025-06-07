import 'package:flutter/material.dart';

import '../../../../../core/basic_features.dart';
import '../../../../../core/widgets/custom_image.dart';

class IconLabelTile extends StatelessWidget {
  const IconLabelTile({
    super.key,
    required this.icon,
    this.labelFontSize,
    this.label,
  });

  final String icon;
  final double? labelFontSize;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: Dimensions.w3,
      children: [
        // Icon
        !icon.contains(".svg")
            ? CustomAssetImage(
                image: icon,
                size: Dimensions.w16,
              )
            : CustomSvgAssetImage(
                image: icon,
                size: Dimensions.w16,
              ),

        // Label
        Text(
          label ?? '',
          style: fontStyleMedium13.copyWith(
            fontSize: labelFontSize ?? Dimensions.w12,
            color: AppColors.hintColor,
          ),
        )
      ],
    );
  }
}
