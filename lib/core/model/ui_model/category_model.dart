import 'dart:ui';

class CommonUIModel {
  final String? id;
  final String title;
  final String? image;
  final String? body;
  final String? thirdLine;
  final VoidCallback? onTap;
  bool isSelected;
  DateTime? dateTime;
  bool isSelectedTwo;
  final List<CommonUIModel>? innerList;

  CommonUIModel(
      {this.id,
      this.image,
      this.onTap,
      this.body,
      this.isSelectedTwo = false,
      this.thirdLine,
      this.dateTime,
      this.innerList,
      required this.title,
      this.isSelected = false});
}
