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
        title: const Text("Cloud Clinic"),
      ),
      body: const SingleChildScrollView(
        child: DoctorsList(),
      ),
    );
  }
}
