import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:oriflame_panel/core/models/ui_models/review_account_ui_model.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/widgets/review_account_grid_tile.dart';

import '../../../../../core/basic_features.dart';
import '../../../../../core/widgets/custom_image.dart';
import 'clickable_platform_row.dart';
import 'icon_label_tile.dart';

class AccountDetailView extends StatelessWidget {
  final PageController pageController;
  final VoidCallback onNextPage;
  final Function(int index) onPageChanged;
  final Function(
    String userID,
    bool isAccepted,
    BuildContext context,
    bool isFromDetailDialog,
  ) onActionTap;
  final List<SocialUserUIModel> users;

  AccountDetailView(
      {super.key,
      required this.pageController,
      required this.onPageChanged,
      required this.users,
      required this.onActionTap,
      required this.onNextPage});

  final Rxn<bool> isApproved = Rxn();

  void _onActionTap(bool isApproved) {
    this.isApproved(isApproved);
    Future.delayed(GetNumUtils(2).seconds, () {
      onNextPage();
      this.isApproved.value = null;
    });
  }

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: 570,
          width: 700,
          child: Material(
            borderRadius: BorderRadius.circular(Dimensions.commonRadius),
            color: AppColors.whiteColor,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.commonRadius),
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) => onPageChanged(value),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final account = users[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: Dimensions.w60,
                      left: Dimensions.w60,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Profile Image
                        CustomRoundCornerNetworkImage(
                            height: Dimensions.h80,
                            width: Dimensions.w80,
                            image: account.avatarUrl),

                        SizedBox(height: Dimensions.h10),

                        // Name
                        Text(
                          account.name,
                          style: fontStyleSemiBold21,
                        ),

                        SizedBox(height: Dimensions.h5),

                        // Address | Gender | User ID | Social Platform Icon + Username | Email
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: Dimensions.w14,
                            children: [
                              // Address
                              IconLabelTile(
                                icon: AppImages.icFlagUk,
                                label: account.location,
                              ),

                              // Gender
                              IconLabelTile(
                                icon: AppImages.icGenderFemale,
                                label: account.age.toString(),
                              ),

                              // User ID
                              IconLabelTile(
                                icon: AppImages.icOriflameUserID,
                                label: account.userId,
                                labelFontSize: Dimensions.sp13,
                              ),

                              // Social Platform Icon
                              IconLabelTile(
                                icon: AppImages.socialIcon(account.platform),
                                label: account.platformLabel,
                                labelFontSize: Dimensions.sp13,
                              ),

                              // Email
                              IconLabelTile(
                                icon: AppImages.icEmail,
                                label: account.email,
                                labelFontSize: Dimensions.sp13,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.h8),

                        MyDivider(),
                        SizedBox(height: Dimensions.h10),

                        // Joined | Last Seen | Last Post
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: Dimensions.w14,
                          children: [
                            // Joined
                            IconLabelTile(
                              icon: AppImages.icCalendar,
                              label:
                                  '${AppString.joined}${AppUtils.formatJoinedDate(account.joinedDate)}',
                            ),

                            // Last Seen
                            IconLabelTile(
                              icon: AppImages.icClock,
                              label:
                                  '${AppString.lastSeen}${AppUtils.formatJoinedDate(account.lastSeen)}',
                            ),

                            // Last Post
                            IconLabelTile(
                              icon: AppImages.icClock,
                              label:
                                  '${AppString.lastPost}${AppUtils.formatJoinedDate(account.lastPost)}',
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.h10),

                        // Trying to Connect
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.h10,
                              horizontal: Dimensions.w20),
                          decoration: BoxDecoration(
                              color: AppColors.selectedSidebarColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.w4)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Trying to Connect
                              Text(
                                AppString.tryingToConnect,
                                style: fontStyleMedium13.copyWith(
                                  fontSize: Dimensions.w12,
                                  color: AppColors.hintColor,
                                ),
                              ),
                              SizedBox(height: Dimensions.h2),

                              // Social Chip
                              SocialMediaIconChip(account: account),
                              SizedBox(height: Dimensions.h6),

                              // Social Username
                              Text(
                                account.handle,
                                style: fontStyleSemiBold18,
                              ),

                              // Social Info
                              if (account.platform != SocialPlatform.whatsapp)
                                Container(
                                  margin: EdgeInsets.symmetric(
                                          horizontal: account.platform ==
                                                      SocialPlatform.facebook ||
                                                  account.platform ==
                                                      SocialPlatform.whatsapp
                                              ? Dimensions.w160
                                              : Dimensions.w130)
                                      .copyWith(top: Dimensions.h13),
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimensions.h4,
                                      horizontal: Dimensions.w8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.commonRadius,
                                    ),
                                    color: AppColors.sidebarColor,
                                  ),
                                  alignment: Alignment.center,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (account.platform ==
                                                SocialPlatform.instagram ||
                                            account.platform ==
                                                SocialPlatform.tiktok) ...[
                                          // Followers
                                          SocialMediaInfoTile(
                                            title: AppString.followers,
                                            count: account.followers,
                                          ),

                                          MyVerticalDivider(),

                                          // Following
                                          SocialMediaInfoTile(
                                            title: AppString.following,
                                            count: account.following,
                                          ), //

                                          MyVerticalDivider(),

                                          // Post
                                          SocialMediaInfoTile(
                                            title: AppString.posts,
                                            count: account.posts,
                                          ),
                                        ],

                                        // Friends
                                        if (account.platform ==
                                            SocialPlatform.facebook)
                                          SocialMediaInfoTile(
                                            title: AppString.friends,
                                            count: account.friends,
                                          )

                                        // Whatsapp ID
                                        else if (account.platform ==
                                            SocialPlatform.whatsapp)
                                          SocialMediaInfoTile(
                                            title: AppString.whatsappID,
                                            count: account.whatsappNumber,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),

                              SizedBox(height: Dimensions.h10),

                              // Go To Social Profile
                              if (account.platform != SocialPlatform.whatsapp)
                                ClickablePlatformRow(
                                  platformLabel: account.platformLabel,
                                  platform: account.platform,
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                            height: Dimensions.h20 +
                                (account.platform == SocialPlatform.whatsapp
                                    ? Dimensions.h75
                                    : 0)),

                        //  Decline | Approve Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: Dimensions.w20,
                          children: [
                            // Decline
                            ActionButton(
                              iconAsset: AppImages.icDeclineCross,
                              label: AppString.decline,
                              size: Dimensions.h35,
                              onPressed: () {
                                _onActionTap(false);
                                onActionTap(
                                  account.userId,
                                  false,
                                  context,
                                  true,
                                );
                              },
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.sizeOf(context).width * 0.07),
                              backgroundColor: AppColors.redColor,
                            ),
                            // Approve
                            ActionButton(
                              iconAsset: AppImages.icApproveCheck,
                              size: Dimensions.h35,
                              label: AppString.approve,
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.sizeOf(context).width * 0.07),
                              onPressed: () {
                                _onActionTap(true);

                                onActionTap(
                                  account.userId,
                                  true,
                                  context,
                                  true,
                                );
                              },
                              backgroundColor: AppColors.primaryColor,
                            ),
                          ],
                        ),

                        // Toast
                        Obx(
                          () => SizedBox(
                            child: isApproved.value != null
                                ? Container(
                                    margin:
                                        EdgeInsets.only(top: Dimensions.h15),
                                    padding: EdgeInsets.symmetric(
                                            vertical: Dimensions.h4)
                                        .copyWith(
                                            left: Dimensions.w6,
                                            right: Dimensions.w12),
                                    decoration: BoxDecoration(
                                      color: isApproved.value!
                                          ? AppColors.greenLightColor
                                          : AppColors.redLightColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              Dimensions.commonRadius),
                                          bottomLeft: Radius.circular(
                                              Dimensions.commonRadius)),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: Dimensions.w4,
                                      children: [
                                        CustomSvgAssetImage(
                                          image: isApproved.value!
                                              ? AppImages.icToastSuccess
                                              : AppImages.icToastFail,
                                          size: Dimensions.w12,
                                        ),
                                        Text(
                                            isApproved.value!
                                                ? AppString
                                                    .accountRequestAccepted
                                                : AppString
                                                    .accountRequestDeclined,
                                            style: fontStyleRegular14.apply(
                                                color: isApproved.value!
                                                    ? AppColors.greenColor
                                                    : AppColors.redColor)),
                                      ],
                                    ),
                                  ).animate().fadeIn(duration: 250.ms)
                                : SizedBox(height: Dimensions.h42),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
