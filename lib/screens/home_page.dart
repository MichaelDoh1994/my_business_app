import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_business_app/components/appointment_card.dart';
import 'package:my_business_app/components/circle_image.dart';
import 'package:my_business_app/components/service/services.dart';
import 'package:my_business_app/data/dummy_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: const CircleImage(
              radius: 20,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Upcoming Appointments',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const AppointmentCard(),
            Text(
              'Offered Services',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: Services(services: dummyServices),
            )
          ],
        ),
      ),
    );
  }
}
