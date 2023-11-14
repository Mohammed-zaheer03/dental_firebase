import 'package:intl/intl.dart';

final DateTime today = DateTime.now();
final formatter = DateFormat('yMMM');

class Patient {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String accountCreatedOn;

  Patient({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  }) : accountCreatedOn = today.day.toString() + formatter.format(today);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }

  static Patient fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }

  static String patientEmail(Patient patient) {
    return patient.email;
  }
}
