import 'package:ekam_cloud_clinic/screens/booking_confirmation_screen.dart';
import 'package:ekam_cloud_clinic/widgets/booking_detail.dart';
import 'package:ekam_cloud_clinic/widgets/doctor_profile_card.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';

class ReviewBookingScreen extends StatelessWidget {
  const ReviewBookingScreen({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Summary"),
        centerTitle: true,
      ),
      body: Column(
        children: [DoctorProfileCard(doctor: doctor), const BookingDetail()],
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
                              return const BookingConfirmationScreen(
                                  // doctor: doctor,
                                  );
                            },
                          ),
                        );
                      },
                      child: const Text("Confirm")),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
