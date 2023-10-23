import 'dart:io';

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.radius,
    required this.image,
  });

  final double radius;
  final File? image;

  @override
  Widget build(context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey,
      foregroundImage: image != null ? FileImage(image!) : null,
    );
  }
}
