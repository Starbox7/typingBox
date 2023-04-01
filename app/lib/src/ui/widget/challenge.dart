import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.now(),
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarStyle: const CalendarStyle(
            isTodayHighlighted: false,
          ),
        )
      ],
    );
  }
}
