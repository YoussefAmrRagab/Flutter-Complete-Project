import 'doctors_list_view.dart';
import 'package:flutter/material.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is Doctors,
      builder: (context, state) => state.maybeWhen(
        doctors: (doctors) => DoctorsListView(
          doctors: doctors,
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
