import 'package:flutter/material.dart';
import 'package:my_business_app/components/no_appointment_card.dart';
import 'package:my_business_app/components/service/services.dart';
import 'package:my_business_app/data/dummy_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.navigateToAppointmentPage,
  });

  final void Function() navigateToAppointmentPage;

  @override
  Widget build(context) {
    return Scaffold(
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
            NoAppointmentCard(
              navigateToAppointmentPage: navigateToAppointmentPage,
            ),
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
