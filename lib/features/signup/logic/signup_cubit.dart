import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/features/signup/data/repos/signup_repo.dart';
import 'package:flutter_complete_project/features/signup/logic/signup_state.dart';

import '../data/models/signup_request_body.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  int? currentOption;

  void _emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: currentOption!,
      ),
    );

    response.when(
      success: (data) => emit(SignupState.success(data)),
      failure: (error) => emit(SignupState.error(error.message)),
    );
  }

  void validateThenSignup() {
    if (formKey.currentState!.validate() && currentOption != null) {
      _emitSignupStates();
    }
  }

  void changeCurrentOption(int index) {
    currentOption = index;
  }
}
