import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oriflame_panel/core/utils/web_toast_utils.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';

import '../../basic_features.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final String lastScreenName;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.lastScreenName = '',
  });

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.h68);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: Dimensions.h68,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.w24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showBackButton
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: Dimensions.w10,
                    children: [
                      // Back Button
                      InkWell(
                        onTap: context.pop,
                        borderRadius: BorderRadius.circular(Dimensions.r10),
                        child: CustomSvgAssetImage(
                          image: AppImages.icBackButton,
                          size: Dimensions.w49,
                        ),
                      ),

                      // Last Screen Text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Last Screen Text
                          Text(
                            '${AppString.goBackTo} $lastScreenName',
                            style: fontStyleRegular12.copyWith(
                              color: AppColors.subTitleTextColor,
                            ),
                          ),

                          // Current Screen Text
                          Text(
                            title,
                            style: fontStyleBold14,
                          ),
                        ],
                      ),
                    ],
                  )
                : Text(
                    title,
                    style: fontStyleBold14,
                  ),
            GestureDetector(
              onTap: () => WebToastUtils.showFeatureUnderDevelopment(context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.h5,
                  horizontal: Dimensions.w12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.r10),
                  border: Border.all(color: AppColors.outlineColor),
                ),
                child: Row(
                  children: [
                    CustomSvgAssetImage(
                      image: AppImages.icFlagUk,
                      height: Dimensions.h20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.w2,
                        right: Dimensions.w6,
                      ),
                      child: Text(
                        "UK",
                        style: fontStyleMedium12.apply(
                          color: AppColors.textGreyColor,
                        ),
                      ),
                    ),
                    CustomSvgAssetImage(
                      image: AppImages.icDropDownArrow,
                      height: Dimensions.h17,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.h1),
        child: Container(
          height: Dimensions.h1,
          color: AppColors.dividerColor,
        ),
      ),
    );
  }
}
