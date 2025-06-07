import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/core/utils/web_toast_utils.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/widgets/review_profile_details_dialog.dart';

import '../../../../../core/models/ui_models/review_account_ui_model.dart'
    show SocialUserUIModel;

class ReviewAccountsController extends GetxController {
  late final bool isArchived;

  final List<String> options = ['Date Connected', 'Username'];
  final RxString selectedValue = 'Date Connected'.obs;
  final RxBool isAscending = true.obs;
  final searchController = TextEditingController();
  final isSearching = false.obs;

  @override
  void onInit() {
    selectedValue.listen((_) => sortAccounts());
    isAscending.listen((_) => sortAccounts());
    searchController.addListener(listenerSearchController);
    super.onInit();
  }

  @override
  void onClose() {
    searchController.removeListener(listenerSearchController);
    searchController.dispose();
    super.onClose();
  }

  // List of Social Media Accounts
  final RxList<SocialUserUIModel> accounts = <SocialUserUIModel>[
    SocialUserUIModel(
      age: 29,
      userId: '3094081',
      location: 'Birmingham, UK',
      name: 'Katy Windsor',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/1.jpg',
      platform: SocialPlatform.instagram,
      handle: '@katy_windsor',
      followers: 3302,
      following: 204,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      posts: 138,
      email: 'katy.windsor@example.com',
      displayUsername: '@katy_windsor',
    ),
    SocialUserUIModel(
      userId: '3094082',
      age: 23,
      name: 'Sabrina Sanders',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/2.jpg',
      platform: SocialPlatform.tiktok,
      handle: '@sabrina239',
      followers: 3703,
      following: 189,
      posts: 201,
      email: 'sabrina@gmail.com',
      location: 'Birmingham, UK',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
    ),
    SocialUserUIModel(
      age: 24,
      userId: '3094083',
      friends: 294,
      name: 'Alex Friedman',
      location: 'Birmingham, UK',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/3.jpg',
      platform: SocialPlatform.facebook,
      handle: 'www.facebook.com/alex.friedman',
      posts: 204,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      email: 'alex.friedman@example.com',
    ),
    SocialUserUIModel(
      age: 23,
      userId: '3094084',
      location: 'Birmingham, UK',
      name: 'Frieda Konts',
      friends: 869,
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/4.jpg',
      platform: SocialPlatform.facebook,
      handle: 'www.facebook.com/frieda.konts',
      posts: 204,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      email: 'frieda.konts@example.com',
    ),
    SocialUserUIModel(
      userId: '3094085',
      age: 18,
      location: 'Birmingham, UK',
      name: 'Maya Chopra',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/5.jpg',
      platform: SocialPlatform.whatsapp,
      handle: '+1 2345678905',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      whatsappNumber: 23039404,
      email: 'maya.chopra@example.com',
    ),
    SocialUserUIModel(
      age: 28,
      userId: '3094086',
      location: 'Birmingham, UK',
      name: 'Lina Grewal',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/6.jpg',
      platform: SocialPlatform.instagram,
      handle: '@lina_grewal',
      followers: 2400,
      following: 180,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      posts: 98,
      email: 'lina.grewal@example.com',
    ),
    SocialUserUIModel(
      userId: '3094087',
      age: 29,
      name: 'Anaya Tan',
      location: 'Birmingham, UK',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/7.jpg',
      platform: SocialPlatform.tiktok,
      handle: '@anaya_t',
      followers: 5000,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      following: 230,
      posts: 540,
      email: 'anaya.tan@example.com',
    ),
    SocialUserUIModel(
      userId: '3094088',
      age: 38,
      location: 'Birmingham, UK',
      name: 'Neha Verma',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/8.jpg',
      platform: SocialPlatform.instagram,
      handle: '@neha.v',
      followers: 1600,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      following: 400,
      posts: 120,
      email: 'neha.verma@example.com',
    ),
    SocialUserUIModel(
      userId: '3094089',
      location: 'Birmingham, UK',
      age: 43,
      name: 'Trisha Kapoor',
      friends: 1944,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/9.jpg',
      platform: SocialPlatform.facebook,
      handle: 'www.facebook.com/trisha.k',
      posts: 290,
      email: 'trisha.kapoor@example.com',
    ),
    SocialUserUIModel(
      userId: '3094090',
      location: 'Birmingham, UK',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      name: 'Alina Gomez',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/10.jpg',
      platform: SocialPlatform.tiktok,
      handle: '@alinag',
      age: 27,
      followers: 1200,
      following: 300,
      posts: 90,
      email: 'alina.gomez@example.com',
    ),
    SocialUserUIModel(
      userId: '3094091',
      location: 'Birmingham, UK',
      age: 31,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      name: 'Sofia Reyes',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/11.jpg',
      platform: SocialPlatform.instagram,
      handle: '@sofia_reyes',
      followers: 4500,
      following: 250,
      posts: 150,
      email: 'sofia.reyes@example.com',
      displayUsername: '@sofia_reyes',
    ),
    SocialUserUIModel(
      userId: '3094092',
      age: 22,
      name: 'Isabella Chen',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/12.jpg',
      platform: SocialPlatform.tiktok,
      handle: '@isabella_c',
      followers: 6000,
      following: 320,
      posts: 220,
      email: 'isabella@example.com',
      location: 'New York, USA',
      joinedDate: DateTime(2022, 1, 10),
      lastSeen: DateTime(2022, 1, 10),
      lastPost: DateTime(2022, 1, 10),
    ),
    SocialUserUIModel(
      userId: '3094093',
      location: 'Birmingham, UK',
      age: 26,
      friends: 500,
      name: 'Olivia Lee',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/13.jpg',
      platform: SocialPlatform.facebook,
      handle: 'www.facebook.com/olivia.lee',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      posts: 300,
      email: 'olivia.lee@example.com',
    ),
    SocialUserUIModel(
      userId: '3094094',
      name: 'Ava Kim',
      age: 33,
      location: 'Birmingham, UK',
      friends: 1200,
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/14.jpg',
      platform: SocialPlatform.facebook,
      handle: 'www.facebook.com/ava.kim',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      posts: 180,
      email: 'ava.kim@example.com',
    ),
    SocialUserUIModel(
      userId: '3094095',
      name: 'Mia Patel',
      age: 20,
      location: 'Birmingham, UK',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/15.jpg',
      platform: SocialPlatform.whatsapp,
      handle: '+1 9876543215',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      whatsappNumber: 98765432,
      email: 'mia.patel@example.com',
    ),
    SocialUserUIModel(
      userId: '3094096',
      name: 'Chloe Nguyen',
      age: 29,
      location: 'Birmingham, UK',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/16.jpg',
      platform: SocialPlatform.instagram,
      handle: '@chloe_n',
      followers: 3200,
      following: 200,
      posts: 110,
      email: 'chloe.nguyen@example.com',
    ),
    SocialUserUIModel(
      userId: '3094097',
      name: 'Emily Garcia',
      age: 25,
      location: 'Birmingham, UK',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/17.jpg',
      platform: SocialPlatform.tiktok,
      handle: '@emily_g',
      followers: 7500,
      following: 400,
      posts: 600,
      email: 'emily.garcia@example.com',
    ),
    SocialUserUIModel(
      userId: '3094098',
      name: 'Grace Rodriguez',
      age: 30,
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      location: 'Birmingham, UK',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/18.jpg',
      platform: SocialPlatform.instagram,
      handle: '@grace.r',
      followers: 2200,
      following: 350,
      posts: 130,
      email: 'grace.rodriguez@example.com',
    ),
    SocialUserUIModel(
      userId: '3094099',
      name: 'Zoe Hernandez',
      age: 35,
      location: 'Birmingham, UK',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      friends: 2500,
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/19.jpg',
      platform: SocialPlatform.facebook,
      handle: 'www.facebook.com/zoe.h',
      posts: 320,
      email: 'zoe.hernandez@example.com',
    ),
    SocialUserUIModel(
      userId: '30940100',
      name: 'Lily Wilson',
      joinedDate: DateTime(2021, 6, 17),
      lastSeen: DateTime(2021, 6, 17),
      lastPost: DateTime(2021, 6, 17),
      age: 21,
      location: 'Birmingham, UK',
      avatarUrl:
          'https://images.weserv.nl/?url=randomuser.me/api/portraits/women/20.jpg',
      platform: SocialPlatform.tiktok,
      handle: '@lilyw',
      followers: 1800,
      following: 280,
      posts: 100,
      email: 'lily.wilson@example.com',
    ),
  ].obs;
  final RxList<SocialUserUIModel> searchedAccounts =
      <SocialUserUIModel>[].obs; // filtered/displayed list

  // To Sort on Basis of Selected Value
  void sortAccounts() {
    if (selectedValue.value == 'Date Connected') {
      accounts.sort((a, b) {
        final dateA = a.joinedDate ?? DateTime.now();
        final dateB = b.joinedDate ?? DateTime.now();
        return isAscending.value
            ? dateA.compareTo(dateB)
            : dateB.compareTo(dateA);
      });
    } else if (selectedValue.value == 'Username') {
      accounts.sort((a, b) {
        final usernameA = a.displayUsername ?? '';
        final usernameB = b.displayUsername ?? '';
        return isAscending.value
            ? usernameA.compareTo(usernameB)
            : usernameB.compareTo(usernameA);
      });
    }
  }

  // Listen to Search Controller
  void listenerSearchController() {
    final query = searchController.text.toLowerCase();

    if (query.isEmpty) {
      isSearching.value = false;
      accounts.value = List.from(accounts);
    } else {
      isSearching.value = true;
      searchedAccounts.value = accounts.where((account) {
        return account.name.toLowerCase().contains(query) ||
            (account.displayUsername?.toLowerCase().contains(query) ?? false) ||
            (account.handle.toLowerCase().contains(query));
      }).toList();
    }
  }

  // Handle Action Tap (Accept/Decline)
  void onActionTap(
    String userID,
    bool isAccepted,
    BuildContext context,
    bool isFromDetailDialog,
  ) {
    // Not Showing Universal Toast when Called from Dialog Box
    if (!isFromDetailDialog) {
      WebToastUtils.show(
          context: context,
          isSuccess: isAccepted,
          message: isAccepted
              ? AppString.accountRequestAccepted
              : AppString.accountRequestDeclined);
    }

    if (isSearching.value) {
      searchedAccounts.removeWhere((element) => element.userId == userID);
    }

    accounts.removeWhere((element) => element.userId == userID);
  }

  // To Show Profile Details Dialog
  void showProfileDetails(BuildContext context, String userID) =>
      showGeneralDialog(
        context: context,
        barrierLabel: 'Profile Viewer',
        barrierDismissible: true,
        useRootNavigator: true,
        barrierColor: AppColors.blackColor.withValues(alpha: 0.6),
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) => ReviewProfileDetailsDialog(
          isArchived: isArchived,
          users: isSearching.value ? searchedAccounts : accounts,
          userID: userID,
          onActionTap: onActionTap,
        ),
        transitionBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      );
}
