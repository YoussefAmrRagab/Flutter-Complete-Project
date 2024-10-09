import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../data/models/specializations_response.dart';

class SpecialityItem extends StatelessWidget {
  final Specialization specialization;
  final int itemIndex;
  final int selectedIndex;

  const SpecialityItem({
    super.key,
    required this.specialization,
    required this.itemIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: Image.asset(
                      'assets/images/${specialization.name.toLowerCase()}.png',
                      height: 36.h,
                      width: 36.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    'assets/images/${specialization.name.toLowerCase()}.png',
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
          8.verticalSpace,
          Text(
            specialization.name,
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
