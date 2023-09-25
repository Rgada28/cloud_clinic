import 'package:flutter/material.dart';

import '../widgets/doctors_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("Ekam Cloud Clinic"),
      ),
      body: const SingleChildScrollView(
        child: DoctorsList(),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: (Doctor doctor) {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return const DoctorDetailsScreen(doctor: doctor,);
      //     }));
      //   },
      //   label: const Text("Schedule Appointment"),
      // ),
    );
  }
}
