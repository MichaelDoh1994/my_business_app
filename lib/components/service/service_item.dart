import 'package:flutter/material.dart';
import 'package:my_business_app/models/services.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(this.service, {super.key});

  final Service service;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          service.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
