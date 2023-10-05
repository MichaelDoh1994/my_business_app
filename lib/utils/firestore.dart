import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? name;
  final String? email;

  User({
    this.name,
    this.email,
  });

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      name: data?['name'],
      email: data?['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "state": email,
    };
  }
}
