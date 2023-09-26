import 'package:ekam_cloud_clinic/model/doctor.dart';

class Booking {
  String bookingId;
  String doctorName;
  DateTime appointmentDate;
  String appointmentTime;
  late Doctor _doctor;
  Doctor get doctor => _doctor;
  set doctor(value) {
    _doctor = value;
  }

  Booking({
    required this.bookingId,
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      bookingId: map['booking_id'],
      doctorName: map['doctor_name'],
      appointmentDate: DateTime.parse(map['appointment_date']),
      appointmentTime: map['appointment_time'],
    );
  }

  Map<String, dynamic> toMap(Booking booking) {
    return {
      'booking_id': booking.bookingId,
      'doctor_name': booking.doctorName,
      'appointment_date': booking.appointmentDate.toIso8601String(),
      'appointment_time': booking.appointmentTime,
    };
  }

  @override
  String toString() {
    return "Booking[\nBookingId:$bookingId\nDoctorName:$doctorName\nAppointment Date:$appointmentDate\nAppointment Time:$appointmentTime\nDoctor$_doctor]";
  }
}
