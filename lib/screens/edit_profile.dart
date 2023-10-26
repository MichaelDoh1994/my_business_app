import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_business_app/components/circle_image_picker.dart';
import 'package:my_business_app/models/user_firestore.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() {
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile> {
  final _form = GlobalKey<FormState>();
  File? _selectedImage;
  var _isLoading = false;
  var _enteredEmail = '';
  var _enteredDateOfBirth = '';
  var _enteredUsername = '';
  var _state = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid || _selectedImage == null) return;

    _form.currentState!.save();

    try {
      setState(() {
        _isLoading = true;
      });

      final userCredentials = FirebaseAuth.instance.currentUser;

      final storageRef =
          FirebaseStorage.instance.ref().child('user_image').child(
                '${userCredentials!.uid}.jpg',
              );

      await storageRef.putFile(_selectedImage!);

      final imageUrl = await storageRef.getDownloadURL();

      final newUser = NewUser(
        name: _enteredUsername,
        email: _enteredEmail,
        username: _enteredUsername,
        dateOfBirth: _enteredDateOfBirth,
        state: _state,
        image: imageUrl,
      );

      final docRef = FirebaseFirestore.instance
          .collection('Users')
          .withConverter<NewUser>(
            fromFirestore: (snapshot, options) => newUser,
            toFirestore: (newUser, options) => newUser.toFirestore(),
          )
          .doc(userCredentials.uid);

      docRef.set(newUser);

      if (!context.mounted) return;
      Navigator.of(context).pop();
    } catch (err) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            err.toString(),
          ),
        ),
      );

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                CircleImagePicker(
                  radius: 80,
                  onPickImage: (pickedImage) {
                    _selectedImage = pickedImage;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'Please enter a valid username - not enough characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Username'),
                    enableSuggestions: false,
                    onSaved: (newValue) {
                      _enteredUsername = newValue!;
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter valid email address';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _enteredEmail = newValue!;
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'Please enter a valid DOB';
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Date of Birth'),
                    enableSuggestions: false,
                    onSaved: (newValue) {
                      _enteredDateOfBirth = newValue!;
                    },
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'Please enter a valid State';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'State',
                    ),
                    enableSuggestions: false,
                    onSaved: (newValue) {
                      _state = newValue!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
