import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../data/models/specializations_response.dart';
import 'speciality_item.dart';

class SpecialitiesListView extends StatelessWidget {
  final List<Specialization> specializations;

  const SpecialitiesListView({super.key, required this.specializations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length,
        itemBuilder: (context, index) {
          return SpecialityItem(
            itemIndex: index,
            selectedIndex: 0,
            specialization: specializations[index],
          );
        },
      ),
    );
  }
}
