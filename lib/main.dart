import 'package:ekam_cloud_clinic/widgets/doctors_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekam Cloud Clinic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 98, 183)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

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
