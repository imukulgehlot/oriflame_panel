import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/widgets/custom_image.dart';

import '../../../../../core/basic_features.dart';

class SortDropdown extends StatelessWidget {
  final List<String> options;
  final RxString selectedValue;

  const SortDropdown(
      {super.key, required this.options, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: Dimensions.w8), // Example padding
          child: Text(
            AppString.sortBy,
            style: fontStyleMedium12.copyWith(color: AppColors.hintColor),
          ),
        ),
        Expanded(
          child: Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                value: selectedValue.value.isNotEmpty &&
                        options.contains(selectedValue.value)
                    ? selectedValue.value
                    : null,
                isExpanded: true,
                items: options
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: fontStyleMedium12.apply(
                              color: AppColors.textGreyColor),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) selectedValue.value = value;
                },
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.w4),
                  height: Dimensions.commonButtonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.r8),
                    border: Border.all(color: AppColors.outlineColor),
                  ),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.r8),
                    color: AppColors.backgroundColor,
                  ),
                  elevation: 2,
                  offset: const Offset(0, 0),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: Dimensions.h40,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.w16, vertical: Dimensions.h10),
                  overlayColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.hovered)) {
                      return AppColors.primaryColor.withValues(alpha: 0.1);
                    }
                    if (states.contains(WidgetState.pressed)) {
                      return AppColors.primaryColor;
                    }
                    return null;
                  }),
                ),
                iconStyleData: IconStyleData(
                  icon: Padding(
                    padding: EdgeInsets.only(right: Dimensions.w8),
                    child: CustomSvgAssetImage(
                      // Assuming this widget exists
                      image: AppImages.icDropDownArrow,
                    ),
                  ),
                  iconSize: Dimensions.h18,
                ),
                selectedItemBuilder: (context) => options
                    .map((item) => Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item,
                            style: fontStyleMedium12.apply(
                              color: AppColors.textColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
