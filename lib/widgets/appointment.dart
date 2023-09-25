import 'package:ekam_cloud_clinic/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  const Appointment(
      {super.key, required this.doctor, required this.setSelectedDateTime});

  final Doctor doctor;
  final Function(DateTime date, String time) setSelectedDateTime;

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  late Doctor doctor;
  int _dateIndex = 0;
  int _timeIndex = 0;
  DateFormat formatter = DateFormat('E-d LLL');
  late List<String> currentTimeSlots;
  @override
  void initState() {
    super.initState();
    doctor = widget.doctor;
    if (doctor.availability!.first.timeSlots.first.trim().isEmpty) {
      currentTimeSlots = [];
    } else {
      currentTimeSlots = doctor.availability!.first.timeSlots;
    }
    //TODO Handle case where timeslots are empty
    widget.setSelectedDateTime(
        doctor.availability!.first.date, currentTimeSlots.first);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 10),
            child: Text(
              "Day",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: doctor.availability!.length,
                itemBuilder: (context, index) {
                  String day = formatter
                      .format(doctor.availability![index].date)
                      .split("-")[0];
                  String date = formatter
                      .format(doctor.availability![index].date)
                      .split("-")[1];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: FilterChip(
                      showCheckmark: false,
                      label: Column(
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                                fontSize: 8,
                                color: _dateIndex == index
                                    ? Colors.grey.shade300
                                    : Colors.black),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 10,
                                color: _dateIndex == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                      selected: _dateIndex == index,
                      onSelected: (value) {
                        setState(() {
                          _dateIndex = index;
                          if (doctor
                              .availability![index].timeSlots.first.isEmpty) {
                            currentTimeSlots = [];
                          } else {
                            currentTimeSlots =
                                doctor.availability![index].timeSlots;
                          }
                        });
                      },
                      selectedColor: Colors.blueAccent.shade700,
                      labelStyle: TextStyle(
                        color: _dateIndex == index
                            ? Colors.white
                            : Colors.blueAccent.shade700,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 20, bottom: 10),
            child: Text(
              "Time",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
            child: currentTimeSlots.isEmpty
                ? const Center(
                    child: Text("No Time slot Available on this date"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: currentTimeSlots.length,
                    itemBuilder: (context, index) {
                      //get Timeslots depending upon the date selected
                      currentTimeSlots =
                          doctor.availability![_dateIndex].timeSlots;
                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: FilterChip(
                          showCheckmark: false,
                          label: Text(
                              currentTimeSlots[index].split("-")[0].trim()),
                          selected: _timeIndex == index,
                          onSelected: (value) {
                            setState(
                              () {
                                _timeIndex = index;
                                widget.setSelectedDateTime(
                                    doctor.availability![_dateIndex].date,
                                    doctor.availability![_dateIndex]
                                        .timeSlots[_timeIndex]);
                              },
                            );
                          },
                          selectedColor: Colors.blueAccent.shade700,
                          labelStyle: TextStyle(
                            color: _timeIndex == index
                                ? Colors.white
                                : Colors.blueAccent.shade700,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
