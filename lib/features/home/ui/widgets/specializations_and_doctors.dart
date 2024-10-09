import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_loading_indicator.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctors/doctors_list_view.dart';
import 'specializations/specialities_list_view.dart';

class SpecializationsAndDoctors extends StatelessWidget {
  const SpecializationsAndDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) => state.maybeWhen(
        loading: () => buildLoading(),
        success: (response) => buildSuccess(response),
        error: (message) => buildError(message),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget buildLoading() => const Expanded(
        child: Center(
          child: AppLoadingIndicator(),
        ),
      );

  Widget buildSuccess(SpecializationsResponse response) {
    return Expanded(
      child: Column(
        children: [
          SpecialitiesListView(
            specializations: response.specializations,
          ),
          8.verticalSpace,
          DoctorsListView(
            doctors: response.specializations[0].doctors,
          ),
        ],
      ),
    );
  }

  Widget buildError(String errorMessage) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_rounded,
              color: Colors.red,
              size: 40.sp,
            ),
            6.verticalSpace,
            Text(
              errorMessage,
              style: TextStyles.font18RedMedium,
            ),
          ],
        ),
      ),
    );
  }
}
