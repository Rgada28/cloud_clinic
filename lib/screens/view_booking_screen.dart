import 'dart:convert';

import 'package:ekam_cloud_clinic/model/booking.dart';
import 'package:ekam_cloud_clinic/widgets/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/doctor.dart';

class ViewBookingScreen extends StatefulWidget {
  const ViewBookingScreen({super.key});

  @override
  State<ViewBookingScreen> createState() => _ViewBookingScreenState();
}

class _ViewBookingScreenState extends State<ViewBookingScreen> {
  List<Doctor> doctors = [];
  List<Booking> bookings = [];

  Future<List<Booking>> getJsonData() async {
    final List doctorData = await rootBundle
        .loadStructuredData('assets/doctors_list.json', (String s) async {
      return jsonDecode(s) as List;
    });

    final List bookingData = await rootBundle
        .loadStructuredData('assets/bookings_list.json', (String s) async {
      return jsonDecode(s) as List;
    });

    for (Map<String, dynamic> element in doctorData) {
      Doctor doctor = Doctor.fromMap(element);
      doctors.add(doctor);
    }

    for (Map<String, dynamic> element in bookingData) {
      Booking booking = Booking.fromMap(element);
      Doctor doctor =
          doctors.firstWhere((element) => booking.doctorName == element.name);
      booking.doctor = doctor;
      bookings.add(booking);
    }
    return bookings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text(
          "My Bookings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListWheelScrollView(
                itemExtent: 300,
                children: bookings.map((booking) {
                  return BookingCard(booking: booking);
                }).toList()
                // return ListView.builder(
                //   itemCount: bookings.length,
                //   itemBuilder: (builder, index) {
                //     return BookingCard(booking: bookings[index]);
                //   },
                );
          }
          return const Center(
            child: Text("Fetching your Bookings"),
          );
        },
      ),
    );
  }
}
