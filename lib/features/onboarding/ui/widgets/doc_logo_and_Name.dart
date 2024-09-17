import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/doc_logo.svg',
        ),
        10.0.margin,
        Text(
          'Docdoc',
          style: TextStyles.font24Black700Weight,
        ),
      ],
    );
  }
}
