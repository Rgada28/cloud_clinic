import 'package:ekam_cloud_clinic/screens/review_booking_screen.dart';
import 'package:ekam_cloud_clinic/widgets/packages_list.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen(
      {super.key, required this.doctor, required this.bookingDetails});

  final Doctor doctor;
  final Map<String, dynamic> bookingDetails;

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
  List<String> times = [
    "Select Time",
    "30 Minutes",
    "45 Minutes",
    "60 Minutes"
  ];

  String selectedTime = "";
  String selectedPackage = "";

  @override
  void initState() {
    super.initState();
    selectedTime = times[0];
  }

  void setPackage(String package) {
    selectedPackage = package;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Package"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Select Duration",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                child: DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  iconEnabledColor: Colors.blueAccent.shade700,
                  value: selectedTime,
                  elevation: 10,
                  decoration: InputDecoration(
                    suffixIconColor: Colors.blueAccent.shade700,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.access_time_filled_sharp,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                  items: times
                      .map<DropdownMenuItem<String>>(
                        (time) => DropdownMenuItem<String>(
                          value: time,
                          child: Text(
                            time,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedTime = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, bottom: 10),
                child: Text(
                  "Select Package",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              PackagesList(setPackage: setPackage),
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 60,
        child: BottomSheet(
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 10,
          onClosing: () {},
          builder: (context) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blueAccent.shade700)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              //TODO Add Validations
                              widget.bookingDetails["duration"] = selectedTime;
                              widget.bookingDetails["package"] =
                                  selectedPackage;
                              return ReviewBookingScreen(
                                doctor: widget.doctor,
                                bookingDetails: widget.bookingDetails,
                              );
                            },
                          ),
                        );
                      },
                      child: const Text("Next")),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
