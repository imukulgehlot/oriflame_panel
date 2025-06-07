import 'package:oriflame_panel/core/utils/enum.dart';

class AppImages {
  static const String noConnection = "assets/images/no_connection.jpg";
  static const String icAppName = "";
  static const String icAppLogo = "assets/images/app_icon.png";

  static const String icCheckCircle = "assets/icons/ic_check_circle.svg";
  static const String icCancel = "assets/icons/ic_cancel.svg";

  // Panel Icons
  static const String icDashboard = "assets/icons/ic_dashboard.svg";
  static const String icSharedContent = "assets/icons/ic_shared_content.svg";
  static const String icMembers = "assets/icons/ic_members.svg";
  static const String icLibraryAssets = "assets/icons/ic_library_assets.svg";
  static const String icEducationHub = "assets/icons/ic_education_hub.svg";
  static const String icCampaigns = "assets/icons/ic_campaigns.svg";
  static const String icCommunities = "assets/icons/ic_communities.svg";
  static const String icHashtags = "assets/icons/ic_hashtags.svg";
  static const String icAIConsole = "assets/icons/ic_ai_console.svg";
  static const String icReviewAccounts = "assets/icons/ic_review_accounts.svg";
  static const String icReviewAccountsUnfilled =
      "assets/icons/ic_review_accounts_unfilled.svg";
  static const String icNotifications = "assets/icons/ic_notifications.svg";
  static const String icSharingControl = "assets/icons/ic_sharing_control.svg";
  static const String icUserManagement = "assets/icons/ic_user_management.svg";
  static const String icAppearance = "assets/icons/ic_appearance.svg";
  static const String icFAQAndTutorials =
      "assets/icons/ic_faq_and_tutorials.svg";
  static const String icPoweredByBrandie =
      "assets/icons/ic_powered_by_brandie.svg";
  static const String icSignOut = "assets/icons/ic_logout.svg";

  // Review Accounts
  static const String icDropDownArrow = "assets/icons/ic_dropdown_arrow.svg";
  static const String icFlagUk = "assets/icons/ic_flag_uk.svg";
  static const String icSearch = "assets/icons/ic_search.svg";
  static const String icFilter = "assets/icons/ic_filter.svg";
  static const String icArchive = "assets/icons/ic_archive.svg";
  static const String icRightArrow = "assets/icons/ic_right_arrow.svg";
  static const String icOriflameUserID = "assets/icons/ic_oriflame_user_id.png";
  static const String icToastFail = "assets/icons/ic_toast_fail.svg";
  static const String icToastSuccess = "assets/icons/ic_toast_success.svg";
  static const String icGenderFemale = "assets/icons/ic_gender_female.svg";
  static const String icApproveCheck = "assets/icons/ic_approve_check.svg";
  static const String icDeclineCross = "assets/icons/ic_decline_cross.svg";
  static const String icFacebook = "assets/icons/ic_facebook.png";
  static const String icInstagram = "assets/icons/ic_instagram.png";
  static const String icTiktok = "assets/icons/ic_tiktok.png";
  static const String icWhatsapp = "assets/icons/ic_whatsapp.png";
  static const String icCalendar = "assets/icons/ic_calendar.svg";
  static const String icClock = "assets/icons/ic_clock.svg";
  static const String icEmail = "assets/icons/ic_email.svg";
  static const String icPrevAccount = "assets/icons/ic_prev_account.svg";
  static const String icNextAccount = "assets/icons/ic_next_account.svg";
  static const String icOpenURL = "assets/icons/ic_open_url.svg";
  static const String icBackButton = "assets/icons/ic_back_button.svg";

  // Platform label getter
  static String socialIcon(SocialPlatform platform) {
    switch (platform) {
      case SocialPlatform.instagram:
        return icInstagram;
      case SocialPlatform.facebook:
        return icFacebook;
      case SocialPlatform.tiktok:
        return icTiktok;
      case SocialPlatform.whatsapp:
        return icWhatsapp;
      default:
        return '';
    }
  }
}
