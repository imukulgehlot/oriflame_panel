import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';

class SortOrderSegmentedControl extends StatelessWidget {
  final RxBool isAscending;

  const SortOrderSegmentedControl({super.key, required this.isAscending});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Dimensions.w72,
        height: Dimensions.commonButtonHeight,
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.h4, horizontal: Dimensions.w3),
        decoration: BoxDecoration(
          color: AppColors.sidebarColor,
          border:
              Border.all(color: AppColors.dividerColor, width: Dimensions.w1),
          borderRadius: BorderRadius.circular(Dimensions.commonRadius),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 200),
              alignment: isAscending.value
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: Dimensions.w32,
                height: Dimensions.w32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.commonRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),

            // Foreground: the icons
            Row(
              children: [
                _buildIconButton(Icons.arrow_upward, true),
                _buildIconButton(Icons.arrow_downward, false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, bool isAscending) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.commonRadius),
        onTap: () => this.isAscending.value = isAscending,
        child: SizedBox(
          width: Dimensions.w36,
          child: Center(
            child: RepaintBoundary(
              child: AnimatedContainer(
                width: Dimensions.w28,
                height: Dimensions.h28,
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: this.isAscending.value == isAscending
                      ? AppColors.primaryColor
                      : AppColors.hintColor,
                  size: Dimensions.h18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
