import 'package:ekam_cloud_clinic/model/doctor.dart';
import 'package:flutter/material.dart';

class DoctorProfileCard extends StatelessWidget {
  const DoctorProfileCard({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 0,
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
                radius: 50,
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
          // const Spacer(),
          // Padding(
          //   padding: const EdgeInsets.only(right: 25.0),
          //   child: Radio.adaptive(
          //     value: packages[0],
          //     groupValue: selectedPackage,
          //     onChanged: (value) {
          //       if (value == null) return;
          //       setState(() {
          //         selectedPackage = value;
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: ListTile(
    //     onTap: () =>
    //         Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return DoctorDetailsScreen(
    //         doctor: doctor,
    //       );
    //     })),
    //     leading: CircleAvatar(
    //       foregroundImage: NetworkImage(doctor.image),
    //     ),
    //     title: Text(
    //       doctor.name,
    //       style: const TextStyle(
    //         fontSize: 18.0,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     subtitle: Text(
    //       doctor.speciality,
    //       style: const TextStyle(
    //         fontSize: 12.0,
    //       ),
    //     ),
    //   ),
    // );
  }
}
