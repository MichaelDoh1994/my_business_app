import 'package:flutter/material.dart';
import 'package:my_business_app/components/circle_image.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(context) {
    final List<Map<String, dynamic>> settingsItems = [
      {'Icon': Icons.edit_attributes_rounded, 'Name': 'Edit Profile'},
      {'Icon': Icons.info_outline_rounded, 'Name': 'About Us'},
      {'Icon': Icons.exit_to_app_rounded, 'Name': 'Log Out'},
      {'Icon': Icons.delete_forever_rounded, 'Name': 'Delete Account'},
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
            Text(
              'User Name Goes Here',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: settingsItems.length,
                itemBuilder: (ctx, idx) => Card(
                  margin: const EdgeInsets.all(20),
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          settingsItems[idx]['Icon'],
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          settingsItems[idx]['Name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
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
