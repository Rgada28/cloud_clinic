import 'package:flutter/material.dart';

class SelectPackageScreen extends StatelessWidget {
  const SelectPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Package"),
        centerTitle: true,
      ),
      body: Placeholder(),
    );
  }
}
