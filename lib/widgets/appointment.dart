import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:ekam_cloud_clinic/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key, required this.doctor});

  final Doctor doctor;

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  DateFormat formatter = DateFormat('dELLL');
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    _selectedDate = widget.doctor.availability!.first.date as DateTime;
    print(formatter.format(_selectedDate));
    print(_selectedDate);
  }

  Container _addDateBar(size) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 15),
      child: DatePicker(
        DateTime.parse(widget.doctor.availability!.first.date),
        height: size.height * .115,
        width: size.height * .09,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          _selectedDate = date;
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        _addDateBar(size),
        TimePickerDialog(initialTime: TimeOfDay.now())
      ],
    );
  }
}
