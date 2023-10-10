import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.radius,
  });

  final double radius;

  @override
  Widget build(context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      backgroundImage: const AssetImage('assets/images/profile.webp'),
    );
  }
}
