import 'package:flutter/material.dart';
import 'package:my_business_app/components/service/services.dart';
import 'package:my_business_app/data/dummy_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Services(
            services: dummyServices,
          ),
        )
      ],
    );
  }
}
