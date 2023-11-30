import 'package:my_business_app/models/service_provider.dart';
import 'package:my_business_app/models/services.dart';
import 'package:my_business_app/models/user_firestore.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Status { available, confirmed, completed }

class Appointment {
  Appointment({
    required this.time,
    required this.date,
    required this.client,
    required this.service,
    required this.provider,
    required this.costOfService,
    required this.status,
  }) : id = uuid.v4();

  final String id;
  final String time;
  final DateTime date;
  final NewUser client;
  final Service service;
  final Provider provider;
  final double costOfService;
  final Status status;
}
