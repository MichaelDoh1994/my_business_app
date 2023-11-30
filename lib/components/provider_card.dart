import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({
    super.key,
    required this.radius,
    required this.name,
    required this.rating,
    required this.experience,
    required this.image,
  });

  final double radius;
  final String name;
  final double rating;
  final String experience;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: radius,
                  backgroundImage: AssetImage(image),
                ),
                Text(name),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Icon(Icons.star),
                  ],
                ),
                Text('$experience of experience'),
                Row(
                  children: [
                    Text(
                      'See Details',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Icon(Icons.ads_click),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
