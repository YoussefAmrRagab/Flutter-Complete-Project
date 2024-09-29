import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/signup_cubit.dart';
import '../../logic/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            context.showLoadingDialog();
          },
          success: (signupResponse) {
            context.pop();
            context.showCustomDialog(
              title: 'Sign Up Successful',
              error: 'Congratulations, you have signed up successfully!',
              dialogType: DialogType.success,
              btnOkText: 'Continue',
              btnOkOnPress: () {
                context.pushNamed(Routes.loginScreen);
              },
            );
          },
          error: (message) {
            context.pop();
            context.showCustomDialog(
              title: 'Authentication Error',
              error: message,
              dialogType: DialogType.error,
              btnOkText: 'Got it',
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
