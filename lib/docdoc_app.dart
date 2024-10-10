import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';

class DocdocApp extends StatelessWidget {
  final AppRouter appRouter;

  const DocdocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Docdoc App',
        debugShowCheckedModeBanner: false,
        initialRoute: hasLaunchedBefore
            ? isLoggedInUser
                ? Routes.homeScreen
                : Routes.loginScreen
            : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          dialogBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(
                ColorsManager.mainBlue.withOpacity(.1),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(
                ColorsManager.mainBlue.withOpacity(.1),
              ),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorsManager.mainBlue,
            selectionColor: ColorsManager.mainBlue.withOpacity(.3),
            selectionHandleColor: ColorsManager.mainBlue,
          ),
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
