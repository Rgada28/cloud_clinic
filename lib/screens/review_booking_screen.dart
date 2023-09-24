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
        title: const Text("Review Booking"),
        centerTitle: true,
      ),
      body: Column(
        children: [DoctorProfileCard(doctor: doctor), const BookingDetail()],
      ),
    );
  }
}
