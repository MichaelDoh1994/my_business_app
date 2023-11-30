import 'package:flutter/material.dart';

class TimeGrid extends StatelessWidget {
  const TimeGrid({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int? currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: currentIndex == index
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(15),
                    color: currentIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 9}:00 ${index + 9 > 11 ? 'PM' : 'AM'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: currentIndex == index ? Colors.white : null,
                    ),
                  ),
                ),
              );
            },
            childCount: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1.5,
          ),
        ),
      ],
    );
  }
}
