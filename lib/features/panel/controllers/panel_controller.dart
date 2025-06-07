import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/model/ui_model/panel_tab_ui_model.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/features/panel/screens/ai_console/ai_console_tab.dart';
import 'package:oriflame_panel/features/panel/screens/appearance/appearance_tab.dart';
import 'package:oriflame_panel/features/panel/screens/campaigns/campaigns_tab.dart';
import 'package:oriflame_panel/features/panel/screens/communities/communities_tab.dart';
import 'package:oriflame_panel/features/panel/screens/education_hub/education_hub_tab.dart';
import 'package:oriflame_panel/features/panel/screens/faq_and_tutorials/faq_and_tutorials_tab.dart';
import 'package:oriflame_panel/features/panel/screens/hashtags/hashtags_tab.dart';
import 'package:oriflame_panel/features/panel/screens/library_assets/library_assets_tab.dart';
import 'package:oriflame_panel/features/panel/screens/members/members_tab.dart';
import 'package:oriflame_panel/features/panel/screens/push_notifications/push_notifications_tab.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/archived_review_accounts_tab.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/review_accounts_tab.dart';
import 'package:oriflame_panel/features/panel/screens/shared_content/shared_content_tab.dart';
import 'package:oriflame_panel/features/panel/screens/sharing_control/sharing_control_tab.dart';
import 'package:oriflame_panel/features/panel/screens/user_management/user_managements_tab.dart';

import '../screens/dashboard/dashboard_tab.dart';

class PanelController extends GetxController {
  final selectedPanelItem = PanelTabType.reviewAccounts.obs;

  // late final currentScreen = Rx<Widget>(ArchivedReviewAccountsTab());
  late final currentScreen = Rx<Widget>(ReviewAccountsTab());

  // Tabs for the Top Panel
  final listTopPanel = [
    PanelTabUIModel(
      label: AppString.dashboard,
      type: PanelTabType.dashboard,
      icon: AppImages.icDashboard,
    ),
    PanelTabUIModel(
      label: AppString.sharedContent,
      type: PanelTabType.sharedContent,
      icon: AppImages.icSharedContent,
    ),
    PanelTabUIModel(
      label: AppString.members,
      type: PanelTabType.members,
      icon: AppImages.icMembers,
    ),
    PanelTabUIModel(
      label: AppString.libraryAssets,
      type: PanelTabType.libraryAssets,
      icon: AppImages.icLibraryAssets,
    ),
    PanelTabUIModel(
      label: AppString.educationHub,
      type: PanelTabType.educationHub,
      icon: AppImages.icEducationHub,
    ),
    PanelTabUIModel(
      label: AppString.campaigns,
      type: PanelTabType.campaigns,
      icon: AppImages.icCampaigns,
    ),
    PanelTabUIModel(
      label: AppString.communities,
      type: PanelTabType.communities,
      icon: AppImages.icCommunities,
    ),
    PanelTabUIModel(
      label: AppString.hashtags,
      type: PanelTabType.hashtags,
      icon: AppImages.icHashtags,
    ),
    PanelTabUIModel(
      label: AppString.aiConsole,
      type: PanelTabType.aiConsole,
      icon: AppImages.icAIConsole,
    ),
  ];

  // Tabs for the Bottom Panel
  final listBottomPanel = [
    PanelTabUIModel(
      label: AppString.reviewAccounts,
      type: PanelTabType.reviewAccounts,
      icon: AppImages.icReviewAccounts,
    ),
    PanelTabUIModel(
      label: AppString.pushNotifications,
      type: PanelTabType.pushNotifications,
      icon: AppImages.icNotifications,
    ),
    PanelTabUIModel(
      label: AppString.sharingControls,
      type: PanelTabType.sharingControls,
      icon: AppImages.icSharingControl,
    ),
    PanelTabUIModel(
      label: AppString.userManagement,
      type: PanelTabType.userManagement,
      icon: AppImages.icUserManagement,
    ),
    PanelTabUIModel(
      label: AppString.appearance,
      type: PanelTabType.appearance,
      icon: AppImages.icAppearance,
    ),
    PanelTabUIModel(
      label: AppString.faqsAndTutorials,
      type: PanelTabType.faqsAndTutorials,
      icon: AppImages.icFAQAndTutorials,
    ),
  ];

  // On Tab Selected
  void onPanelTap(PanelTabType panelTabType) {
    if (panelTabType == PanelTabType.signOut) return;

    selectedPanelItem.value = panelTabType;

    currentScreen.value = switch (panelTabType) {
      PanelTabType.dashboard => const DashboardTab(),
      PanelTabType.sharedContent => const SharedContentTab(),
      PanelTabType.members => const MembersTab(),
      PanelTabType.libraryAssets => const LibraryAssetsTab(),
      PanelTabType.educationHub => const EducationHubTab(),
      PanelTabType.campaigns => const CampaignsTab(),
      PanelTabType.communities => const CommunitiesTab(),
      PanelTabType.hashtags => const HashtagsTab(),
      PanelTabType.aiConsole => const AIConsoleTab(),
      PanelTabType.pushNotifications => const PushNotificationsTab(),
      PanelTabType.sharingControls => const SharingControlTab(),
      PanelTabType.userManagement => const UserManagementsTab(),
      PanelTabType.appearance => const AppearanceTab(),
      PanelTabType.faqsAndTutorials => const FAQAndTutorials(),
      // _ => const ArchivedReviewAccountsTab(),
      _ => const ReviewAccountsTab(),
    };
  }
}
