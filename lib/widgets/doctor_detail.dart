import 'package:flutter/material.dart';

import '../model/doctor.dart';

class DoctorDetail extends StatelessWidget {
  const DoctorDetail({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.people,
                  color: Colors.blue.shade700,
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
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.work,
                  color: Colors.blue.shade700,
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
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.star,
                  color: Colors.blue.shade700,
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
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.chat,
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
