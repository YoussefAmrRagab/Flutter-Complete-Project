import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import '../logic/home_cubit.dart';
import 'widgets/doctor_blue_container.dart';
import 'widgets/doctors/doctors_bloc_builder.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specializations/specializations_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getSpecializations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, top: 16, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              24.verticalSpace,
              buildDoctorSpecialitiesTextBar(),
              16.verticalSpace,
              const SpecializationsBlocBuilder(),
              8.verticalSpace,
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDoctorSpecialitiesTextBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyles.font12BlueRegular,
          ),
        )
      ],
    );
  }
}
