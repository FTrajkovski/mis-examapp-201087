import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = [
      Exam(
        title: 'Веројатност и Статистика',
        dateOfExam: DateTime(2025, 11, 12, 9),
        locations: ['Просторија 101', 'АМФ ФИНКИ'],
      ),
      Exam(
        title: 'Мобилни информациски системи',
        dateOfExam: DateTime(2025, 11, 15, 8),
        locations: ['АМФ ТМФ'],
      ),
      Exam(
        title: 'Бинис и Менаџмент',
        dateOfExam: DateTime(2025, 11, 18, 12),
        locations: ['137', '101'],
      ),
      Exam(
        title: 'Стуктурно Програмирање Теорија',
        dateOfExam: DateTime(2025, 11, 19, 12),
        locations: ['200АБ'],
      ),
      Exam(
        title: 'Алгоритми и Податочни Структури',
        dateOfExam: DateTime(2025, 11, 22, 14),
        locations: ['200', '303', '302'],
      ),
      Exam(
        title: 'Мултимедиски Технологии',
        dateOfExam: DateTime(2025, 11, 5, 14),
        locations: ['200АБ', '202', '203'],
      ),
      Exam(
        title: 'Стуктурно Програмирање Практично',
        dateOfExam: DateTime(2025, 11, 19, 8),
        locations: ['200AБ'],
      ),
      Exam(
        title: 'Софтверски Квалитет и Тестирање',
        dateOfExam: DateTime(2025, 11, 20, 9),
        locations: ['АМФ ТМФ'],
      ),
      Exam(
        title: 'Вовед во Науката за Податоци',
        dateOfExam: DateTime(2025, 11, 13, 9),
        locations: ['201', '203'],
      ),
      Exam(
        title: 'Бази на Податоци',
        dateOfExam: DateTime(2025, 11, 9, 18),
        locations: ['Онлајн'],
      ),
    ];

    exams.sort((a, b) => a.dateOfExam.compareTo(b.dateOfExam));

    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text('Распоред на испити - 201087')),
      body: ListView(
        children: [
          ...exams.map((exam) {
            final isPast = exam.dateOfExam.isBefore(today);

            final color = isPast ? Colors.grey.shade300 : Colors.green.shade200;

            return ExamCard(color: color, exam: exam);
          }),
        ],
      ),
      floatingActionButton: Chip(
        label: Text('Вкупно: ${exams.length}'),
        backgroundColor: Colors.blue,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
