import 'package:flutter/material.dart';
import 'package:my_business_app/components/provider_card.dart';
import 'package:my_business_app/data/dummy_service_providers.dart';
import 'package:my_business_app/models/service_provider.dart';

class ProviderList extends StatefulWidget {
  const ProviderList({
    super.key,
    required this.dummyProviders,
    required this.radius,
  });

  final List<Provider> dummyProviders;
  final double radius;

  @override
  State<ProviderList> createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyProviders.length,
      itemBuilder: (ctx, idx) => ProviderCard(
        radius: widget.radius,
        name: dummyProviders[idx].name,
        rating: dummyProviders[idx].rating,
        experience: dummyProviders[idx].experience,
        image: dummyProviders[idx].image,
      ),
    );
  }
}
