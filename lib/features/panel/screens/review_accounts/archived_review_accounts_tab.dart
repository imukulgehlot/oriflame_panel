import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/widgets/common/cutom_app_bar.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/widgets/review_account_grid_tile.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/widgets/review_account_top_tile.dart';

import 'controllers/review_accounts_controller.dart';

class ArchivedReviewAccountsTab extends StatelessWidget {
  const ArchivedReviewAccountsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReviewAccountsController(),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          title: AppString.reviewAccounts,
          showBackButton: true,
          lastScreenName: AppString.reviewAccounts,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final crossAxisCount = screenWidth > 1200
                ? 3
                : screenWidth > 700
                    ? 2
                    : 1;

            final childRatio = _calculateChildRatio(screenWidth);
            return Column(
              children: [
                // Search bar | Sort By | Sort Order | Filter | Archive | Validate
                ReviewAccountTopTile(
                  controller: controller,
                  isArchived: true,
                ),

                // Accounts Grid
                Expanded(
                  child: Obx(
                    () => GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.w85,
                        vertical: Dimensions.h25,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: Dimensions.w25,
                        crossAxisSpacing: Dimensions.w25,
                        childAspectRatio: childRatio,
                      ),
                      itemCount: controller.isSearching.value
                          ? controller.searchedAccounts.length
                          : controller.accounts.length,
                      itemBuilder: (context, index) {
                        final list = controller.isSearching.value
                            ? controller.searchedAccounts
                            : controller.accounts;

                        return ReviewAccountGridTile(
                          account: list[index],
                          onActionTap: (userID, isAccepted, context) =>
                              controller.onActionTap(
                                  userID, isAccepted, context, false),
                          onProfileTap: (context, userID) =>
                              controller.showProfileDetails(context, userID),
                          key: ValueKey(
                            list[index].userId,
                          ),
                        );
                      },
                    )
                        .animate()
                        .fadeIn(
                          duration: const Duration(milliseconds: 300),
                          delay: const Duration(milliseconds: 300),
                        )
                        .slideY(
                          begin: -0.02,
                          duration: const Duration(milliseconds: 200),
                          delay: const Duration(milliseconds: 300),
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  double _calculateChildRatio(double screenWidth) {
    if (screenWidth > 1190) return 314 / 200;
    if (screenWidth > 1020) return 314 / 170;
    if (screenWidth > 1000) return 314 / 165;
    if (screenWidth > 920) return 314 / 250;
    if (screenWidth > 900) return 314 / 160;
    if (screenWidth > 750) return 314 / 230;
    return 314 / 200;
  }
}
