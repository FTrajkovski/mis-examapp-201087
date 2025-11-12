import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetails extends StatelessWidget {

  const ExamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    final now = DateTime.now();
    final difference = exam.dateOfExam.difference(now);

    final days = difference.inDays;
    final hours = difference.inHours.remainder(24);

    final dateStr = DateFormat('dd MMM yyyy, HH:mm').format(exam.dateOfExam);

    final isPast = difference.isNegative;

    final timeInfo = isPast
        ? 'Испитот помина пред ${days.abs()} дена, ${hours.abs()} часа.'
        : 'Преостанува уште $days дена, $hours часа.';

    final titleColor = days.abs()<1 ? Colors.greenAccent : Colors.blueAccent;

    return Scaffold(
      appBar: AppBar(title: Text(exam.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: titleColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  exam.title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.blueGrey),
                  const SizedBox(width: 8),
                  Text('Датум: $dateStr', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Локации:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            ...exam.locations.map(
              (loc) => Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(loc, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Icon(Icons.timer, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  timeInfo,
                  style: TextStyle(
                    fontSize: 16,
                    color: isPast ? Colors.grey : Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
