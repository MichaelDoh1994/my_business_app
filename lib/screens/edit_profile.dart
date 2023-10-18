import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(context) {
    return const Scaffold(
      body: Center(
        child: Text('Appointment Page!'),
      ),
    );
  }
}
