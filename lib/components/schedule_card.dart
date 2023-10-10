import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 120,
      padding: const EdgeInsets.all(10),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Colors.white,
                size: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '10/09/2023',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm_rounded,
                color: Colors.white,
                size: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  '4:00 pm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
