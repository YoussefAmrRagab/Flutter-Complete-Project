import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/login_cubit.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyles.font24BlueBold,
                      ),
                      8.verticalSpace,
                      Text(
                        'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                        style: TextStyles.font14GrayRegular,
                      ),
                      36.verticalSpace,
                      Column(
                        children: [
                          const EmailAndPassword(),
                          10.verticalSpace,
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyles.font13BlueRegular,
                            ),
                          ),
                          20.verticalSpace,
                          AppTextButton(
                            buttonText: 'Login',
                            buttonHeight: 50.h,
                            verticalPadding: 14.h,
                            horizontalPadding: 12.w,
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () {
                              context.read<LoginCubit>().validateThenLogin();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const TermsAndConditionsText(),
              20.verticalSpace,
              const DontHaveAccountText(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
