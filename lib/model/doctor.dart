class Doctor {
  // int id;
  String name;
  String image;
  String speciality;
  String location;
  int patientsServed;
  int yearsOfExperience;
  double rating;
  int numberOfReviews;
  List<Availability>? availability;

  Doctor(
      {
      // required this.id,
      required this.name,
      required this.image,
      required this.speciality,
      required this.location,
      required this.patientsServed,
      required this.yearsOfExperience,
      required this.rating,
      required this.numberOfReviews,
      required this.availability});
  factory Doctor.fromMap(Map<String, dynamic> map) {
    List<Availability> availabilityList = [];
    Map<String, dynamic> dateMap = map["availability"] as Map<String, dynamic>;

    for (int i = 0; i < dateMap.values.length; i++) {
      String timeSlotString = dateMap.values.elementAt(i).toString();
      timeSlotString = timeSlotString.substring(1, timeSlotString.length - 1);
      List<String> timeslots =
          timeSlotString.split(",").map((e) => e.trim()).toList();
      availabilityList.add(Availability(
          date: DateTime.parse(dateMap.keys.elementAt(i)),
          timeSlots: timeslots));
    }

    return Doctor(
      // id: map['id'],
      name: map['doctor_name'],
      image: map['image'],
      speciality: map['speciality'],
      location: map['location'],
      patientsServed: map['patients_served'],
      yearsOfExperience: map['years_of_experience'],
      rating: map['rating'],
      numberOfReviews: map['number_of_reviews'],
      availability: availabilityList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'doctor_name': name,
      'image': image,
      'speciality': speciality,
      'location': location,
      'patients_served': patientsServed,
      'years_of_experience': yearsOfExperience,
      'rating': rating,
      'number_of_reviews': numberOfReviews,
      'availability': availability
    };
  }

  @override
  String toString() {
    return 'Doctor(name: $name, image: $image, speciality: $speciality, location: $location, patientsServed: $patientsServed, yearsOfExperience: $yearsOfExperience, rating: $rating, numberOfReviews: $numberOfReviews, availability: $availability)';
  }
}

class Availability {
  DateTime date;
  List<String> timeSlots;

  Availability({required this.date, required this.timeSlots});

  factory Availability.fromMap(Map<String, dynamic> map) {
    return Availability(
      date: DateTime.parse(map['date']),
      timeSlots: map['timeSlots'].map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'timeSlots': timeSlots,
    };
  }

  @override
  String toString() {
    return 'Availibility[date:$date,timeslots:$timeSlots]';
  }
}
