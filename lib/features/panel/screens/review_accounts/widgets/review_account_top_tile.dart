import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:oriflame_panel/core/utils/web_toast_utils.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';
import 'package:oriflame_panel/core/widgets/text_field/text_field/my_text_field.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/archived_review_accounts_tab.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/widgets/sort_order_segmented_control.dart';

import '../../../../../core/basic_features.dart';
import '../controllers/review_accounts_controller.dart';
import 'sort_drop_down.dart';

class ReviewAccountTopTile extends StatelessWidget {
  final ReviewAccountsController controller;
  final bool isArchived;

  const ReviewAccountTopTile({
    super.key,
    required this.controller,
    this.isArchived = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
          padding: EdgeInsets.only(
            left: Dimensions.w20,
            top: Dimensions.w20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: Dimensions.h36,
              width: constraints.maxWidth - Dimensions.w30,
              child: Row(
                children: [
                  // Search bar
                  Flexible(
                    flex: 5,
                    child: MyTextField(
                      hintTextColor: AppColors.hintColor,
                      textInputAction: TextInputAction.search,
                      hintText: AppString.searchByUserName,
                      textController: controller.searchController,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.w13, right: Dimensions.w3),
                        child: CustomSvgAssetImage(
                          image: AppImages.icSearch,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.w19),

                  if (isArchived) Spacer(flex: 6),

                  // Sort By
                  Flexible(
                    flex: isArchived ? 3 : 2,
                    child: SortDropdown(
                      options: controller.options,
                      selectedValue: controller.selectedValue,
                    ),
                  ),
                  SizedBox(width: Dimensions.w8),

                  // Sort Order
                  SortOrderSegmentedControl(
                    isAscending: controller.isAscending,
                  ),
                  SizedBox(width: Dimensions.w19),

                  // Filter
                  AppIconButton(
                    iconAsset: AppImages.icFilter,
                    label: AppString.filter,
                    onPressed: () =>
                        WebToastUtils.showFeatureUnderDevelopment(context),
                  ),

                  // Archive | Validate
                  if (!isArchived) ...[
                    SizedBox(width: Dimensions.w19),

                    // Archive
                    AppIconButton(
                      iconAsset: AppImages.icArchive,
                      label: AppString.archive,
                      borderColor: AppColors.primaryColor,
                      textColor: AppColors.primaryColor,
                      onPressed: () {
                        void showArchivedTabOverlay(BuildContext context) {
                          showGeneralDialog(
                            context: context,
                            barrierLabel: '',
                            barrierDismissible: true,
                            barrierColor: Colors.transparent,
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Align(
                                alignment: Alignment.centerRight,
                                child: FractionallySizedBox(
                                  widthFactor: 0.85,
                                  heightFactor: 1,
                                  child: Material(
                                    color: Colors.white,
                                    child: ArchivedReviewAccountsTab(),
                                  ),
                                ),
                              );
                            },
                            transitionBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                          );
                        }

                        showArchivedTabOverlay(context);
                        // context.push('/archived_review_accounts_tab');
                      },
                    ),
                    SizedBox(width: Dimensions.w19),

                    // Validate
                    AppIconButton(
                      iconAsset: AppImages.icRightArrow,
                      showBorder: false,
                      label: AppString.validate,
                      backgroundColor: AppColors.primaryColor,
                      textColor: AppColors.whiteColor,
                      onPressed: () =>
                          WebToastUtils.showFeatureUnderDevelopment(context),
                      iconFirst: false,
                    ),
                  ],

                  SizedBox(width: Dimensions.w19),
                ],
              )
                  .animate()
                  .fadeIn(
                    duration: const Duration(milliseconds: 300),
                    delay: const Duration(milliseconds: 100),
                  )
                  .slideY(
                    begin: -0.2,
                    duration: const Duration(milliseconds: 200),
                    delay: const Duration(milliseconds: 100),
                  ),
            ),
          )),
    );
  }
}
