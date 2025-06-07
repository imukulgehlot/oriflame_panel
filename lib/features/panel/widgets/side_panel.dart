import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/model/ui_model/panel_tab_ui_model.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';
import 'package:oriflame_panel/features/panel/controllers/panel_controller.dart';
import 'package:oriflame_panel/features/panel/widgets/panel_tab_item.dart';

import '../../../core/basic_features.dart';

class SidePanel extends StatelessWidget {
  final PanelController controller;

  const SidePanel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w230,
      decoration: BoxDecoration(
        color: AppColors.sidebarColor,
        border: Border(
          right:
              BorderSide(color: AppColors.dividerColor, width: Dimensions.h1),
          bottom:
              BorderSide(color: AppColors.dividerColor, width: Dimensions.h1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          SizedBox(
            height: Dimensions.h68,
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.w36),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomAssetImage(
                  image: AppImages.icAppLogo,
                  height: Dimensions.h30,
                ),
              ),
            ),
          ),

          // Panel List | Divider | Panel List
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Panel List (1)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.listTopPanel.length,
                      itemBuilder: (context, index) {
                        final tab = controller.listTopPanel[index];
                        final isSelected =
                            controller.selectedPanelItem.value == tab.type;

                        return PanelTabItem(
                          tab: tab,
                          isSelected: isSelected,
                          onPanelSelected: (type) =>
                              controller.onPanelTap(type),
                        );
                      },
                    ),

                    // Divider
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.h17,
                        horizontal: Dimensions.w24,
                      ),
                      child: MyDivider(),
                    ),

                    // Bottom Panel List (2)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.listBottomPanel.length,
                      itemBuilder: (context, index) {
                        final tab = controller.listBottomPanel[index];
                        final isSelected =
                            controller.selectedPanelItem.value == tab.type;

                        return PanelTabItem(
                          tab: tab,
                          isSelected: isSelected,
                          onPanelSelected: (type) =>
                              controller.onPanelTap(type),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Sign Out and Footer
          Padding(
            padding: EdgeInsets.only(
              bottom: Dimensions.h12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimensions.h25,
              children: [
                // Sign Out Button
                PanelTabItem(
                  tab: PanelTabUIModel(
                    label: AppString.signOut,
                    type: PanelTabType.signOut,
                    icon: AppImages.icSignOut,
                  ),
                  onPanelSelected: (PanelTabType type) =>
                      controller.onPanelTap(type),
                  isSelected: false,
                ),

                // Footer with Powered by Brandie
                Center(
                  child: CustomSvgAssetImage(
                    image: AppImages.icPoweredByBrandie,
                    height: Dimensions.h15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
