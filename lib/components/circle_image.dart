import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final db = FirebaseFirestore.instance;
final userCredentials = FirebaseAuth.instance.currentUser!;

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.radius,
  });

  final double radius;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await db.collection("Users").doc(userCredentials.uid).get();
  }

  @override
  Widget build(context) {
    return FutureBuilder(
      future: getUser(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong.'),
          );
        }

        if (!snapshot.data!.data()!.containsKey('image')) {
          return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
          );
        }

        final loadedImage = snapshot.data!['image'];

        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey,
          foregroundImage: NetworkImage(
            loadedImage,
          ),
        );
      },
    );
  }
}
