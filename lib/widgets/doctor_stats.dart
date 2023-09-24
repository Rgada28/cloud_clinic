import 'package:flutter/material.dart';

import '../model/doctor.dart';

class DoctorStats extends StatelessWidget {
  const DoctorStats({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  Icons.people,
                  color: Colors.blueAccent.shade700,
                  size: 30,
                ),
              ),
              Text(
                "${doctor.patientsServed}+",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700),
              ),
              const Text("Patients"),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  Icons.work,
                  color: Colors.blue.shade700,
                  size: 30,
                ),
              ),
              Text(
                "${doctor.yearsOfExperience}+",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700),
              ),
              const Text("Years Exp."),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  Icons.star,
                  color: Colors.blue.shade700,
                  size: 30,
                ),
              ),
              Text(
                "${doctor.rating}+",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700),
              ),
              const Text("Rating"),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  Icons.chat,
                  size: 30,
                  color: Colors.blue.shade700,
                ),
              ),
              Text(
                "${doctor.numberOfReviews}+",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700),
              ),
              const Text("Review"),
            ],
          ),
        ],
      ),
    );
  }
}
