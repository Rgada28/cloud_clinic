import 'package:ekam_cloud_clinic/main.dart';
import 'package:ekam_cloud_clinic/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import 'home_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});
  static Map<String, dynamic> values = {
    "doctor_name": "Dr. John Doe",
    "appointment_date": "2023-09-18",
    "appointment_time": "09:00 AM - 09:30 AM",
    "location": "123 Health St, MedCity",
    "appointment_package": "Video Call"
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Confirmation",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 5),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Icon(Icons.check_circle_rounded,
                      size: 150, color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            const Text(
              "Appointment Confirmed!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You have successfully booked appointment with',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              '${values["doctor_name"]}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Dash(
                direction: Axis.horizontal,
                length: 350,
                dashGap: 10,
                dashThickness: 1,
                dashColor: Colors.grey.shade300),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.blueAccent.shade700),
                  const Text("\tEsther Howard",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20),
              child: Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.blueAccent.shade700),
                  const Text("\t16 Aug, 2023",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 50,
                  ),
                  Icon(Icons.timer_rounded, color: Colors.blueAccent.shade700),
                  const Text("\t10:00 AM",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
        bottomSheet: SizedBox(
          height: 120,
          child: BottomSheet(
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 10,
            onClosing: () {},
            builder: (context) {
              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
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
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const TabScreen(
                                    index: 1,
                                  );
                                }),
                                (route) => false,
                              );
                            },
                            child: const Text("View Appointments")),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const TabScreen(
                              index: 0,
                            );
                          }),
                          (route) => false,
                        );
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              Colors.blueAccent.shade700)),
                      child: const Text(
                        "Book Another",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
