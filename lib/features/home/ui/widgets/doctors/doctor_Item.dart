import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_loading_indicator.dart';
import '../../../data/models/specializations_response.dart';

class DoctorItem extends StatelessWidget {
  final Doctor doctor;

  const DoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              imageUrl: 'https://www.pngplay.com/wp-content/uploads/7/Doctor-Transparent-PNG.png',
              width: 110.w,
              height: 120.h,
              progressIndicatorBuilder: (context, url, progress) => const AppLoadingIndicator(),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                5.verticalSpace,
                Text(
                  '${doctor.degree} | ${doctor.phone}',
                  style: TextStyles.font12GrayMedium,
                ),
                5.verticalSpace,
                Text(
                  doctor.email,
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
