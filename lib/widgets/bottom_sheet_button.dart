import 'package:flutter/material.dart';

import '../model/doctor.dart';
import '../screens/select_package_screen.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton(
      {super.key,
      required this.doctor,
      required this.route,
      required this.buttonText});

  final Doctor doctor;
  final MaterialPageRoute route;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 10,
        onClosing: () {},
        builder: (context) {
          return Center(
            child: Expanded(
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blueAccent.shade700)),
                  onPressed: () {
                    Navigator.push(context, route);
                  },
                  child: Text(buttonText)),
            ),
          );
        });
  }
}
