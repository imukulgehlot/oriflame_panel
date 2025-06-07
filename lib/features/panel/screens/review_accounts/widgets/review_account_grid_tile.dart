import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/models/ui_models/review_account_ui_model.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';

import '../../../../../core/basic_features.dart';

class ReviewAccountGridTile extends StatelessWidget {
  ReviewAccountGridTile({
    super.key,
    required this.account,
    required this.onActionTap,
    required this.onProfileTap,
    this.isArchived = false
  });

  final Function(String userID, bool isAccepted,BuildContext context) onActionTap;
  final Function(BuildContext context, String userID) onProfileTap;
  final SocialUserUIModel account;
  final bool isArchived;

  final _isHovered = false.obs;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _isHovered(true),
      onExit: (_) => _isHovered(false),
      child: GestureDetector(
        onTap: () => onProfileTap(context, account.userId),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimensions.w13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.commonRadius),
            border: Border.all(
              color: AppColors.dividerColor,
              width: Dimensions.h1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile, Name, User ID
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.w13),
                child: Row(
                  spacing: Dimensions.w4,
                  children: [
                    // Profile Image
                    CustomRoundCornerNetworkImage(
                        height: Dimensions.h45,
                        width: Dimensions.w45,
                        image: account.avatarUrl),

                    // Name and User ID
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          account.name,
                          style: fontStyleSemiBold15,
                        ),

                        Row(
                          spacing: Dimensions.w3,
                          children: [
                            // UserID Logo
                            CustomAssetImage(
                              image: AppImages.icOriflameUserID,
                              height: Dimensions.h13,
                              width: Dimensions.w13,
                            ),

                            // User ID
                            Text(
                              '${AppString.id} ${account.userId}',
                              style: fontStyleRegular12.copyWith(
                                color: AppColors.textGreyColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Divider
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.h13),
                child: MyDivider(color: AppColors.dividerColor),
              ),

              // Social Media Chip || Approve | Decline on Hover
              // Social Media User Name | URL
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.w13),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Social Media Chip | Social Media User Name
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: Dimensions.h3,
                            children: [
                              // Social Media Chip
                              SocialMediaIconChip(account: account),

                              // Social Handle
                              if (account.platform != SocialPlatform.whatsapp)
                                Text(
                                  account.handle,
                                  overflow: TextOverflow.ellipsis,
                                  style: fontStyleBold14,
                                ),
                            ],
                          ),
                        ),

                        // Approve and Decline Button on Hover
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: _isHovered.value ? 1.0 : 0.0,
                          child: AnimatedScale(
                            duration: const Duration(milliseconds: 150),
                            scale: _isHovered.value ? 1.0 : 0.8,
                            curve: Curves.easeOutBack,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: Dimensions.w10,
                              children: [
                                // Decline
                                if(!isArchived)
                                ActionButton(
                                  iconAsset: AppImages.icDeclineCross,
                                  size: Dimensions.h35,
                                  onPressed: () => onActionTap(
                                      account.userId,
                                      false,
                                      context
                                  ),
                                  backgroundColor: AppColors.redColor,
                                ),

                                // Approve
                                ActionButton(
                                  iconAsset: AppImages.icApproveCheck,
                                  size: Dimensions.h35,
                                  onPressed: () => onActionTap(
                                    account.userId,
                                    true,
                                    context
                                  ),
                                  backgroundColor: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Followers | Following | Posts (Instagram and Tiktok)
              // Friends (Facebook)
              // Whatsapp ID (WhatsApp)
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.w13)
                      .copyWith(top: Dimensions.h13),
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.h4, horizontal: Dimensions.w8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.commonRadius,
                    ),
                    color: AppColors.sidebarColor,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        if (account.platform == SocialPlatform.instagram ||
                            account.platform == SocialPlatform.tiktok) ...[
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
                        if (account.platform == SocialPlatform.facebook)
                          SocialMediaInfoTile(
                            title: AppString.friends,
                            count: account.friends,
                          )

                        // Whatsapp ID
                        else if (account.platform == SocialPlatform.whatsapp)
                          SocialMediaInfoTile(
                            title: AppString.whatsappID,
                            count: account.whatsappNumber,
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaIconChip extends StatelessWidget {
  const SocialMediaIconChip({
    super.key,
    required this.account,
  });

  final SocialUserUIModel account;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.r15),
        color: AppColors.sidebarColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.h5,
        horizontal: Dimensions.w10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: Dimensions.w3,
        children: [
          // Platform Icon
          CustomAssetImage(
            image: AppImages.socialIcon(account.platform),
            size: Dimensions.w16,
          ),

          // Platform Name
          Text(
            account.platformLabel,
            style: fontStyleSemiBold13.copyWith(
              color: AppColors.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaInfoTile extends StatelessWidget {
  const SocialMediaInfoTile({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Count
          Text(
            '${count ?? 0}',
            style: fontStyleBold12,
          ),

          // Label
          Text(
            title,
            style: fontStyleRegular12.copyWith(
              color: AppColors.darkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
