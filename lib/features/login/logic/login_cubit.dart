import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';

import 'login_state.dart';
import '../data/repos/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(
      success: (data) => emit(LoginState.success(data)),
      failure: (error) => emit(LoginState.error(error.apiErrorModel.message)),
    );
  }

  void validateThenLogin() {
    if (formKey.currentState!.validate()) {
      _emitLoginStates(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
