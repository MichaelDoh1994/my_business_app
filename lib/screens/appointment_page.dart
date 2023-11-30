import 'package:flutter/material.dart';
import 'package:my_business_app/components/time_grid.dart';
import 'package:my_business_app/data/dummy_services.dart';
import 'package:my_business_app/screens/service_and_provider.dart';
import 'package:my_business_app/data/dummy_service_providers.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() {
    return _AppointmentScreenState();
  }
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  DateTime? _selectedDay;
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.now(),
            lastDay: DateTime(2023, 12, 31),
            calendarFormat: _format,
            currentDay: _currentDay,
            rowHeight: 48,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              defaultDecoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
              CalendarFormat.twoWeeks: '2 weeks',
              CalendarFormat.week: 'Week'
            },
            onFormatChanged: (format) {
              if (_format != format) {
                setState(() {
                  _format = format;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _currentDay = selectedDay;
                  _focusedDay = focusedDay;
                  _dateSelected = true;

                  if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
                    _isWeekend = true;
                    _timeSelected = false;
                    _currentIndex = null;
                  } else {
                    _isWeekend = false;
                  }
                });
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Available time slots',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (_isWeekend)
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Text(
                'Weekends are not available, please pick a weekday!',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            )
          else
            Expanded(
              child: TimeGrid(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    _timeSelected = true;
                  });
                },
              ),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const ServiceAndProvider(
                    services: dummyServices,
                    providers: dummyProviders,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
