import 'package:flutter/material.dart';
import '../../../data/models/specializations_response.dart';
import 'doctor_Item.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorsListView({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorItem(doctor: doctors[index]);
        },
      ),
    );
  }
}
