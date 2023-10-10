import 'package:flutter/material.dart';
import 'package:my_business_app/components/circle_image.dart';

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 200,
      padding: const EdgeInsets.all(10),
      child: const Row(
        children: [
          CircleImage(
            radius: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text('Solemn Litany', style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              Text(
                'Hair-Stylist',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
