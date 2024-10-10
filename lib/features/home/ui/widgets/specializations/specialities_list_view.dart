import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/specializations_response.dart';
import '../../../logic/home_cubit.dart';
import 'speciality_item.dart';

class SpecialitiesListView extends StatefulWidget {
  final List<Specialization> specializations;

  const SpecialitiesListView({super.key, required this.specializations});

  @override
  State<SpecialitiesListView> createState() => _SpecialitiesListViewState();
}

class _SpecialitiesListViewState extends State<SpecialitiesListView> {
  int selectedSpecializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().filterDoctorsBySpecializationId(
                    widget.specializations[index].id,
                  );
            },
            child: SpecialityItem(
              itemIndex: index,
              selectedIndex: selectedSpecializationIndex,
              specialization: widget.specializations[index],
            ),
          );
        },
      ),
    );
  }
}
