import 'dart:convert';

import 'package:ekam_cloud_clinic/model/doctor.dart';
import 'package:ekam_cloud_clinic/screens/doctor_detail_screen.dart';
import 'package:ekam_cloud_clinic/widgets/doctor_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({super.key});

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  List<Doctor> doctors = [];

  Future<List<Doctor>> getJsonData() async {
    final String jsonData = await rootBundle.loadString('doctors_list.json');
    final List data = jsonDecode(jsonData) as List;

    for (Map<String, dynamic> element in data) {
      Doctor doctor = Doctor.fromMap(element);
      doctors.add(doctor);
    }
    return doctors;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: FutureBuilder(
        future: getJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: doctors.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DoctorDetailsScreen(
                                  doctor: doctors[index]);
                            },
                          ),
                        );
                      },
                      child: DoctorProfileCard(doctor: doctors[index]));
                }));
          }
          return const Text("Fetching Data");
        },
      ),
    );
  }
}
