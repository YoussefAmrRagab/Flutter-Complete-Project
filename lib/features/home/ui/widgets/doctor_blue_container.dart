import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: const DecorationImage(
                image: AssetImage('assets/images/home_blue_container.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: buildContainerContent(),
          ),
          buildDoctorImage()
        ],
      ),
    );
  }

  Column buildContainerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Book and\nschedule with\nnearest doctor',
          style: TextStyles.font18WhiteMedium,
        ),
        16.verticalSpace,
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
            ),
            child: Text(
              'Find Nearby',
              style: TextStyles.font12BlueRegular,
            ),
          ),
        )
      ],
    );
  }

  Positioned buildDoctorImage() {
    return Positioned(
      right: 16,
      top: 0,
      child: Image.asset(
        'assets/images/home_doctor.png',
        height: 200.h,
      ),
    );
  }
}
