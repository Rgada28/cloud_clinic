import 'package:ekam_cloud_clinic/model/doctor.dart';
import 'package:flutter/material.dart';

class DoctorProfileCard extends StatelessWidget {
  const DoctorProfileCard({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 1,
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Stack(children: [
              CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(doctor.image),
              ),
              Positioned(
                  bottom: 10,
                  right: 5,
                  child: Icon(
                    Icons.verified,
                    color: Colors.blueAccent.shade700,
                  ))
            ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  doctor.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                doctor.speciality,
                style: const TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_pin_circle_sharp,
                      color: Colors.blueAccent.shade700,
                      size: 20,
                    ),
                    Text(" ${doctor.location} "),
                    Icon(
                      Icons.map,
                      color: Colors.blueAccent.shade700,
                      size: 20,
                    ),
                    const Divider(color: Colors.black)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
