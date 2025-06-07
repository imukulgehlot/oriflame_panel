import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/features/panel/widgets/side_panel.dart';

import 'controllers/panel_controller.dart';

class PanelScreen extends StatelessWidget {
  const PanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PanelController(),
      builder: (controller) => Scaffold(
        body: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sidebar
              SidePanel(
                controller: controller,
              ),

              // Selected Sidebar Content
              Expanded(child: controller.currentScreen.value),
            ],
          ),
        ),
      ),
    );
  }
}
