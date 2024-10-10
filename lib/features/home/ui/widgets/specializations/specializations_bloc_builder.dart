import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors/doctors_shimmer_loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/styles.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'specialities_list_view.dart';
import 'speciality_shimmer_loading.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Specializations || current is Error,
      builder: (context, state) => state.maybeWhen(
        loading: () => buildLoading(),
        specializations: (specializations) => SpecialitiesListView(
          specializations: specializations,
        ),
        error: (message) => buildError(message),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget buildLoading() => Expanded(
        child: Column(
          children: [
            const SpecialityShimmerLoading(),
            8.verticalSpace,
            const DoctorsShimmerLoading()
          ],
        ),
      );

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
