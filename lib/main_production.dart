import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/docdoc_app.dart';
import 'core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIsLaunchedBefore();
  await checkIsLoggedIn();
  runApp(
    DocdocApp(
      appRouter: AppRouter(),
    ),
  );
}

Future<void> checkIsLoggedIn() async {
  String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (token.isNotEmpty) {
    isLoggedInUser = true;
  }
}

Future<void> checkIsLaunchedBefore() async {
  bool isLaunchedBefore = await SharedPrefHelper.getBool(SharedPrefKeys.hasLaunchedBefore);
  hasLaunchedBefore = isLaunchedBefore;
}
