import 'package:my_business_app/models/services.dart';

class Provider {
  const Provider({
    required this.name,
    required this.image,
    required this.experience,
    required this.services,
    required this.rating,
  });

  final String name;
  final String image;
  final String experience;
  final List<Service> services;
  final double rating;
}
