import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../app_color/color.dart';

/// Calendar Widget with Circular Progress Indicator inside each day cell
class CalendarWidget extends StatelessWidget {
  final DateTime initialFocusedDay = DateTime.now();

  CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
        weekdayStyle: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),
      ),
      calendarStyle: const CalendarStyle(
        selectedDecoration: BoxDecoration(color: Colors.transparent),
        selectedTextStyle: TextStyle(color: Colors.black),
        withinRangeTextStyle: TextStyle(color: Colors.white),
      ),
      headerStyle: const HeaderStyle(
        titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        formatButtonVisible: false,
        titleCentered: true,
      ),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2040, 3, 14),
      focusedDay: initialFocusedDay,
      selectedDayPredicate: (day) => isSameDay(day, initialFocusedDay),
      calendarBuilders: CalendarBuilders(
        /// Default day builder (for all unselected days)
        defaultBuilder: (context, day, focusedDay) {
          return _buildDayCell(day, false);
        },

        /// Selected day builder (for today and other selected days)
        selectedBuilder: (context, day, focusedDay) {
          return _buildDayCell(day, true);
        },
      ),
    );
  }

  /// Custom method to build the day cell (reusable)
  Widget _buildDayCell(DateTime day, bool isSelected) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: 0.5, // Example progress value
          strokeWidth: 3.0,
          backgroundColor: Colors.grey.shade300,
          color: AppColor.primaryColor,
        ),
        Text(
          '${day.day}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Highlight today's date
          ),
        ),
      ],
    );
  }
}
