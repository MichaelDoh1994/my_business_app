import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_business_app/screens/edit_profile.dart';

import '../components/circle_image.dart';

final userCredentials = FirebaseAuth.instance.currentUser!;
final db = FirebaseFirestore.instance;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void deleteAccount() async {
    await userCredentials.delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await db.collection("Users").doc(userCredentials.uid).get();
  }

  @override
  Widget build(context) {
    final List<Map<String, dynamic>> settingsItems = [
      {
        'Icon': Icons.edit_attributes_rounded,
        'Name': 'Edit Profile',
        'Action': () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const EditProfile(),
              ),
            ),
      },
      {
        'Icon': Icons.info_outline_rounded,
        'Name': 'About Us',
        'Action': () => showDialog(
              context: context,
              builder: (context) => const AboutDialog(
                applicationIcon: FlutterLogo(),
                applicationLegalese: 'Legalese',
                applicationName: 'My Business App',
                applicationVersion: '1.0.0',
                children: [
                  Text('Created by Michael Doh'),
                ],
              ),
            )
      },
      {
        'Icon': Icons.exit_to_app_rounded,
        'Name': 'Log Out',
        'Action': () => FirebaseAuth.instance.signOut(),
      },
      {
        'Icon': Icons.delete_forever_rounded,
        'Name': 'Delete Account',
        'Action': () => deleteAccount(),
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Column(
          children: [
            const CircleImage(
              radius: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: getUser(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final username = snapshot.data!['username'];

                return Text(
                  username,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: settingsItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextButton.icon(
                    onPressed: settingsItems[index]['Action'],
                    icon: Icon(
                      settingsItems[index]['Icon'],
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      settingsItems[index]['Name'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(
                        BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
