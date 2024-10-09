import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theming/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final double size;

  const AppLoadingIndicator({super.key, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.inkDrop(
      color: ColorsManager.mainBlue,
      size: size,
    );
  }
}
