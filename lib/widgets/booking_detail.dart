import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDetail extends StatelessWidget {
  const BookingDetail({super.key, required this.bookingDetails});
  final Map<String, dynamic> bookingDetails;

  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat.yMMMMd('en_US');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date & Hour",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Text(
                  '${(formatter.format(bookingDetails["date"]))} | ${bookingDetails['time']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Package",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Text(
                  bookingDetails['package'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duration",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Text(
                  bookingDetails['duration'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Booking for",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const Text(
                  "Self",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
