import 'package:ekam_cloud_clinic/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:intl/intl.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key, required this.bookingDetails});
  final Map<String, dynamic> bookingDetails;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat.yMMMMd('en_US');
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
              '${bookingDetails["doctor_name"]}',
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
                  Text(
                    formatter.format(bookingDetails["date"]),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Icon(Icons.timer_rounded, color: Colors.blueAccent.shade700),
                  Text(bookingDetails['time'],
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
        bottomSheet: SizedBox(
          height: 130,
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
                          horizontal: 20, vertical: 15),
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
