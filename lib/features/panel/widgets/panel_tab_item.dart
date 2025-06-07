import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/model/ui_model/panel_tab_ui_model.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';

import '../../../core/basic_features.dart';

class PanelTabItem extends StatelessWidget {
  const PanelTabItem({
    super.key,
    required this.tab,
    required this.onPanelSelected,
    required this.isSelected,
  });

  final PanelTabUIModel tab;
  final Function(PanelTabType type) onPanelSelected;
  final bool isSelected;

  bool get isReviewAccountsTab => tab.type == PanelTabType.reviewAccounts;

  bool get isSignOut => tab.type == PanelTabType.signOut;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPanelSelected(tab.type),
      hoverColor:
          isSignOut ? AppColors.redColor.withValues(alpha: 0.1) : null,
      minTileHeight: Dimensions.h35,
      title: Row(
        spacing: Dimensions.w4,
        children: [
          // Icon
          CustomSvgAssetImage(
            image: isSelected
                ? tab.icon
                : isReviewAccountsTab
                    ? AppImages.icReviewAccountsUnfilled
                    : tab.icon,
            height: Dimensions.h16,
            width: Dimensions.h16,
            color: isSelected ? AppColors.primaryColor : null,
          ),

          // Text
          Text(
            tab.label,
            style: isSelected
                ? fontStyleBold14.apply(
                    color: AppColors.primaryColor,
                  )
                : fontStyleMedium14.apply(
                    color: isSignOut
                        ? AppColors.redColor
                        : AppColors.textGreyColor,
                  ),
          ),

          // New Accounts Indicator
          if (isReviewAccountsTab)
            Container(
              padding: EdgeInsets.all(Dimensions.h4),
              decoration: BoxDecoration(
                  color: AppColors.redColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: AppColors.whiteColor, width: Dimensions.h1)),
              child: Text(
                '32',
                style: fontStyleBold8.apply(color: AppColors.whiteColor),
              ),
            )
        ],
      ),
      contentPadding: EdgeInsets.only(
        left: Dimensions.w28,
      ),
      selectedTileColor: AppColors.selectedSidebarColor,
      selected: isSelected,
    );
  }
}
