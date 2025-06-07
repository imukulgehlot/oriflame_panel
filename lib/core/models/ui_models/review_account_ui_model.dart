

import 'package:oriflame_panel/core/utils/enum.dart';

class SocialUserUIModel {
  // Basic Info
  final String userId; // platform ID or system-wide ID
  final String name;
  final String avatarUrl;
  final SocialPlatform platform;
  final String handle; // username / whatsapp no. / profile link

  // Optional Universal Fields
  final String? displayUsername; // shown on card, e.g., @sabrina239
  final String? location;
  final int age;
  final String? gender;
  final String? email;
  final DateTime? joinedDate;
  final DateTime? lastSeen;
  final DateTime? lastPost;

  // Platform-Specific Data (nullable)
  final int? followers;
  final int? following;
  final int? posts; // or likes, depending
  final int? friends; // for Facebook
  final String? facebookProfileUrl; // for Facebook
  final int? whatsappNumber; // for WhatsApp

  const SocialUserUIModel({
    required this.userId,
    required this.name,
    required this.avatarUrl,
    required this.platform,
    required this.handle,

    this.displayUsername,
    this.location,
    required this.age,
    this.gender,
    this.email,
    this.joinedDate,
    this.lastSeen,
    this.lastPost,

    this.friends,
    this.followers,
    this.following,
    this.posts,
    this.facebookProfileUrl,
    this.whatsappNumber,
  });

  // Platform label getter
  String get platformLabel {
    switch (platform) {
      case SocialPlatform.instagram:
        return 'Instagram';
      case SocialPlatform.facebook:
        return 'Facebook';
      case SocialPlatform.tiktok:
        return 'TikTok';
      case SocialPlatform.whatsapp:
        return 'WhatsApp';
      default:
        return 'Unknown';
    }
  }
}
