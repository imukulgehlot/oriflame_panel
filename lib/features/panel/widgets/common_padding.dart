import 'package:flutter/material.dart';
import 'package:oriflame_panel/core/constants/dimensions.dart';

class CommonPadding extends StatelessWidget {
  final Widget child;

  const CommonPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.w30),
        child: child,
      );
}
