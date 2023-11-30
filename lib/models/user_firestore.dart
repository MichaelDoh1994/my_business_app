import 'package:cloud_firestore/cloud_firestore.dart';
import 'appointment.dart';

class NewUser {
  final String? name;
  final String? email;
  final String? username;
  final String? dateOfBirth;
  final String? state;
  final String? image;
  final List<Appointment>? appointments;

  NewUser({
    this.name,
    this.email,
    this.username,
    this.dateOfBirth,
    this.state,
    this.image,
    this.appointments,
  });

  factory NewUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return NewUser(
      name: data?['name'],
      email: data?['email'],
      username: data?['username'],
      dateOfBirth: data?['dateOfBirth'],
      state: data?['state'],
      image: data?['image'],
      appointments: data?['appointments'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (username != null) "username": username,
      if (dateOfBirth != null) "dateOfBirth": dateOfBirth,
      if (state != null) "state": state,
      if (image != null) "image": image,
      if (appointments != null) "appointments": appointments,
    };
  }

  static fromJson(Map<String, dynamic> map) {}
}
