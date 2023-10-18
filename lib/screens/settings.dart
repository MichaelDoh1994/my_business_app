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
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
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
