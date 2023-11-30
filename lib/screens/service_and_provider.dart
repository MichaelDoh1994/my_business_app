import 'package:flutter/material.dart';
import 'package:my_business_app/components/provider_list.dart';
import 'package:my_business_app/components/services_image_carousel.dart';
import 'package:my_business_app/models/service_provider.dart';
import 'package:my_business_app/models/services.dart';

class ServiceAndProvider extends StatefulWidget {
  const ServiceAndProvider({
    super.key,
    required this.services,
    required this.providers,
  });

  final List<Service> services;
  final List<Provider> providers;

  @override
  State<ServiceAndProvider> createState() => _ServiceAndProviderState();
}

class _ServiceAndProviderState extends State<ServiceAndProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Services',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: ServicesCarousel(
                services: widget.services,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Providers',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ProviderList(
                dummyProviders: widget.providers,
                radius: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
