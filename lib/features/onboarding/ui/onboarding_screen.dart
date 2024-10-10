import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/theming/styles.dart';
import 'widgets/doctor_image_and_text.dart';
import 'widgets/docdoc_logo_and_Name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            children: [
              const DocDocLogoAndName(),
              30.0.verticalSpace,
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      textAlign: TextAlign.center,
                      style: TextStyles.font13GrayRegular,
                    ),
                    30.0.verticalSpace,
                    AppTextButton(
                      buttonText: 'Get Started',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        SharedPrefHelper.setData(SharedPrefKeys.hasLaunchedBefore, true);
                        context.pushReplacementNamed(Routes.loginScreen);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
