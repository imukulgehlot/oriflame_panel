import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/basic_features.dart';
import 'package:oriflame_panel/core/widgets/common/cutom_app_bar.dart';

class LibraryAssetsTab extends StatelessWidget {
  const LibraryAssetsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppString.libraryAssets),
      body: Center(
        child: Text(AppString.libraryAssets),
      ),
    );
  }
}
