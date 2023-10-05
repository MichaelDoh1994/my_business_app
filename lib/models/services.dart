import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Service {
  const Service({
    required this.title,
    required this.image,
    required this.description,
  });

  final String title;
  final String image;
  final String description;
}
