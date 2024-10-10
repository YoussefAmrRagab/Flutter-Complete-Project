import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Youssef!',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular,
            )
          ],
        ),
        buildNotificationsButton()
      ],
    );
  }

  Widget buildNotificationsButton() {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: ColorsManager.moreLighterGray,
            child: SvgPicture.asset('assets/svgs/notifications.svg'),
          ),
          const Positioned(
            right: 10,
            top: 12,
            child: CircleAvatar(
              radius: 3.5,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
