import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/utils/enum.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/basic_features.dart';

class ClickablePlatformRow extends StatelessWidget {
  final String platformLabel;
  final SocialPlatform platform;

  ClickablePlatformRow({
    super.key,
    required this.platformLabel,
    required this.platform,
  });

  final Map<String, String> platformUrls = {
    'Instagram': 'https://www.instagram.com',
    'WhatsApp': 'https://www.whatsapp.com',
    'Facebook': 'https://www.facebook.com',
    'TikTok': 'https://www.tiktok.com',
    // Add more if needed
  };

  late final urlString = platformUrls[platformLabel] ?? '';
  late final uri = Uri.parse(urlString);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSvgAssetImage(
              image: AppImages.icOpenURL,
              size: Dimensions.w16
            ),
            SizedBox(width: Dimensions.w3),
            Text(
              '${AppString.goTo} $platformLabel ${platform == SocialPlatform.facebook ? AppString.url : AppString.profile}',
              style: fontStyleBold12.apply(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
