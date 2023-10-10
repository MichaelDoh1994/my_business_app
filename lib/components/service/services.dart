import 'package:flutter/material.dart';
import 'package:my_business_app/components/service/service_item.dart';
import 'package:my_business_app/models/services.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
    required this.services,
  });

  final List<Service> services;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (ctx, index) => ServiceItem(
        services[index],
      ),
    );
  }
}
