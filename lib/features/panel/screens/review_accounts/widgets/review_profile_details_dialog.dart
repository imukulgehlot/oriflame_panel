import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/models/ui_models/review_account_ui_model.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';
import 'package:oriflame_panel/features/panel/screens/review_accounts/widgets/account_detail_view.dart';

class ReviewProfileDetailsDialog extends StatefulWidget {
  final List<SocialUserUIModel> users;
  final String userID;
  final bool isArchived;
  final Function(String userID, bool isAccepted, BuildContext context,
      bool isFromDetailDialog) onActionTap;

  const ReviewProfileDetailsDialog({
    super.key,
    required this.users,
    required this.userID,
    required this.onActionTap, required this.isArchived,
  });

  @override
  State<ReviewProfileDetailsDialog> createState() =>
      _ReviewProfileDetailsDialogState();
}

class _ReviewProfileDetailsDialogState
    extends State<ReviewProfileDetailsDialog> {
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.users.indexWhere(
      (element) => element.userId == widget.userID,
    );
    _pageController = PageController(initialPage: _currentPage);
  }

  void _next() {
    if (_currentPage < widget.users.length - 1) {
      _pageController.nextPage(duration: 300.ms, curve: Curves.ease);
    }
  }

  void _prev() {
    if (_currentPage > 0) {
      _pageController.previousPage(duration: 300.ms, curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Necessary!
      body: FocusableActionDetector(
        autofocus: true,
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.escape): EscapeIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight): NextIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): PreviousIntent(),
        },
        actions: {
          EscapeIntent: CallbackAction(onInvoke: (intent) => context.pop()),
          NextIntent: CallbackAction(onInvoke: (intent) => _next()),
          PreviousIntent: CallbackAction(onInvoke: (intent) => _prev()),
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Blurred Background
            GestureDetector(
              onTap: context.pop,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: ColoredBox(color: Colors.white.withValues(alpha: 0.2)),
              ),
            ),

            // Detail View
            AccountDetailView(
              pageController: _pageController,
              isArchived: widget.isArchived,
              onPageChanged: (index) => setState(() => _currentPage = index),
              onActionTap: widget.onActionTap,
              onNextPage: _next,
              users: widget.users,
            ),

            // Left Arrow
            if (_currentPage > 0)
              Positioned(
                left: Dimensions.w16,
                top: MediaQuery.of(context).size.height / 2 - 24,
                child:
                    _ArrowButton(onTap: _prev, icon: AppImages.icPrevAccount),
              ),

            // Right Arrow
            if (_currentPage < widget.users.length - 1)
              Positioned(
                right: Dimensions.w16,
                top: MediaQuery.of(context).size.height / 2 - 24,
                child:
                    _ArrowButton(onTap: _next, icon: AppImages.icNextAccount),
              ),
          ],
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;

  const _ArrowButton({required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomSvgAssetImage(
        image: icon,
      ),
    );
  }
}

// Intents for keyboard shortcuts
class NextIntent extends Intent {}

class EscapeIntent extends Intent {}

class PreviousIntent extends Intent {}
