import 'package:ekam_cloud_clinic/screens/select_package_screen.dart';
import 'package:ekam_cloud_clinic/widgets/doctor_profile_card.dart';
import 'package:ekam_cloud_clinic/widgets/doctor_stats.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';
import '../widgets/appointment.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  late DateTime selectedDate;
  late String selectedTime;
  final Map<String, dynamic> dateTime = {};

  void setDateAndTime(DateTime date, String time) {
    selectedDate = date;
    selectedTime = time;
    dateTime["date"] = selectedDate;
    dateTime["time"] = selectedTime.split("-")[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Book Appointment"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorProfileCard(doctor: widget.doctor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DoctorStats(doctor: widget.doctor),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "BOOK APPOINTMENT",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Appointment(
              doctor: widget.doctor,
              setSelectedDateTime: setDateAndTime,
            ),
          ],
        ),
        bottomSheet: SizedBox(
          height: 70,
          child: BottomSheet(
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 10,
            onClosing: () {},
            builder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blueAccent.shade700)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SelectPackageScreen(
                                  doctor: widget.doctor,
                                  bookingDetails: dateTime,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text("Make Appointment")),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
