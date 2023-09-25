import 'package:ekam_cloud_clinic/model/booking.dart';
import 'package:ekam_cloud_clinic/screens/doctor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat.yMMMd('en_US');
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.grey, width: 0.5)),
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                '${formatter.format(booking.appointmentDate)} - ${booking.appointmentTime.split("-")[0]}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Colors.grey.shade300, width: 0.5))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Image.network(booking.doctor.image)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.doctorName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop_outlined,
                                  color: Colors.blueAccent.shade700,
                                ),
                                Text("\t${booking.doctor.location}"),
                              ],
                            ),
                            Row(
                              children: [
                                //TODO change Icon
                                Icon(
                                  Icons.badge_outlined,
                                  color: Colors.blueAccent.shade700,
                                ),
                                const Text(
                                  '\tBooking ID : ',
                                ),
                                Text(
                                  "#${booking.bookingId}",
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer)),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DoctorDetailsScreen(doctor: booking.doctor);
                          }));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blueAccent.shade700),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white)),
                        child: const Text("Reschedule")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
