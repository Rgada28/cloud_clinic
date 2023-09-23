import 'package:ekam_cloud_clinic/model/doctor.dart';
import 'package:ekam_cloud_clinic/screens/doctor_detail_screen.dart';
import 'package:flutter/material.dart';

class DoctorProfileCard extends StatelessWidget {
  const DoctorProfileCard({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DoctorDetailsScreen(
            doctor: doctor,
          );
        })),
        leading: CircleAvatar(
          foregroundImage: NetworkImage(doctor.image),
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          doctor.speciality,
          style: const TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
