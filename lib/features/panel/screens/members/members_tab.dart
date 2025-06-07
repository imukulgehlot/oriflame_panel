import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/widgets/common/cutom_app_bar.dart';

class MembersTab extends StatelessWidget {
  const MembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppString.members),
      body: Center(
        child: Text(AppString.members),
      ),
    );
  }
}
