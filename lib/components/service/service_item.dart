import 'package:flutter/material.dart';
import 'package:my_business_app/models/services.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(this.service, {super.key});

  final Service service;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      width: 100,
      height: 100,
      child: Image.asset(
        service.image,
      ),
    );
  }
}
