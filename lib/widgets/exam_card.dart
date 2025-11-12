import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final Color? color;
  
  // ignore: prefer_const_constructors_in_immutables
  ExamCard({super.key, required this.exam, this.color});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd MMM yyyy').format(exam.dateOfExam);
    final locationsStr = exam.locations.join(', ');

    return Card(
      margin: const EdgeInsets.all(8),
      color: color ?? Colors.white,
      elevation: 3,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/details", arguments: exam);
        },
        leading: const Icon(Icons.school, color: Colors.blue),
        title: Text(
          exam.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(dateStr),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Expanded(child: Text(locationsStr)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
