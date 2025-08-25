import 'package:flutter/material.dart';

class AttendanceTile extends StatelessWidget {
  final String membername;
  final String date;
  final String checkIn;
  final String checkOut;
  final String hours;
  final String status;

  const AttendanceTile({
    super.key,
    required this.membername,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.hours,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.calendar_today, color: Colors.indigo),
        title: Text(membername),
        subtitle: Text("Date: $date | In: $checkIn | Out: $checkOut | Hours: $hours"),
        trailing: Text(
          status,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: status == "Late" ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
