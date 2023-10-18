import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? name;
  final String? email;
  final String? username;

  User({
    this.name,
    this.email,
    this.username,
  });

  factory User.fromFirestore(
    DocumentSnapshot<User> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      name: data?.name,
      email: data?.email,
      username: data?.username,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (username != null) "email": username,
    };
  }
}
