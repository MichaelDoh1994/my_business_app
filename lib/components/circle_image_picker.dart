import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CircleImagePicker extends StatefulWidget {
  const CircleImagePicker({
    super.key,
    required this.radius,
    required this.onPickImage,
  });

  final double radius;
  final void Function(File pickedImage) onPickImage;

  @override
  State<CircleImagePicker> createState() {
    return _CircleImagePickerState();
  }
}

class _CircleImagePickerState extends State<CircleImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) return;

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        CircleAvatar(
          radius: widget.radius,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label: Text(
            'Update Image',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
