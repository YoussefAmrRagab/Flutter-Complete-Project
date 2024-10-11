import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../networking/api_error_model.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension Dialog on BuildContext {
  void showCustomDialog({
    required String title,
    required String error,
    required DialogType dialogType,
    required String btnOkText,
    VoidCallback? btnOkOnPress,
  }) {
    AwesomeDialog(
      context: this,
      dialogBackgroundColor: Colors.white,
      dialogType: dialogType,
      animType: AnimType.scale,
      title: title,
      titleTextStyle: dialogType == DialogType.error
          ? TextStyles.font18RedMedium
          : TextStyles.font18DarkBlueSemiBold,
      desc: error,
      btnOkText: btnOkText,
      btnOkOnPress: btnOkOnPress ?? () {},
      btnOkColor: ColorsManager.mainBlue,
    ).show();
  }

  void showLoadingDialog() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => Stack(
        children: [
          Center(
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                color: ColorsManager.mainBlue,
                strokeWidth: 4,
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension ToastMessage on String {
  void get showToast => Fluttertoast.showToast(
        msg: this,
        toastLength: Toast.LENGTH_SHORT,
      );
}

extension ErrorHandlerMessage on ApiErrorModel {
  String get msg => errors != null
      ? errors is Errors
          ? (errors as Errors).message
          : errors as String
      : message!;
}
