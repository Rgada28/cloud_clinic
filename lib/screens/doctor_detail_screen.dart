import 'package:ekam_cloud_clinic/screens/select_package_screen.dart';
import 'package:ekam_cloud_clinic/widgets/doctor_detail.dart';
import 'package:ekam_cloud_clinic/widgets/doctor_profile_card.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';
import '../widgets/appointment.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Book Appointment"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DoctorProfileCard(doctor: doctor),
              DoctorDetail(doctor: doctor),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("BOOK APPOINTMENT"),
              ),
              // Appointment(
              //   doctor: doctor,
              // ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: 60,
          child: BottomSheet(
              shadowColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 10,
              onClosing: () {},
              builder: (context) {
                return Center(
                  child: Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SelectPackageScreen();
                              },
                            ),
                          );
                        },
                        child: const Text("Make Appointment")),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
