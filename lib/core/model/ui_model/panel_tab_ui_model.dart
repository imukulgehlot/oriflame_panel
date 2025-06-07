import 'package:oriflame_panel/core/utils/enum.dart';

class PanelTabUIModel {
  final String label;
  final PanelTabType type;
  final String icon;
  final String? selectedIcon;

  const PanelTabUIModel({
    required this.label,
    required this.type,
    required this.icon,
    this.selectedIcon,
  });
}
