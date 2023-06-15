import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Bucket { home, work, others }

const bucketIcons = {
  Bucket.home: Icons.home_work_outlined,
  Bucket.work: Icons.home_repair_service,
  Bucket.others: Icons.analytics_outlined
};

final formatter = DateFormat.yMd();

class Todo {
  const Todo(
      {required this.title,
      required this.dueDate,
      required this.bucket,
      required this.isCompleted});
  final String title;
  final DateTime dueDate;
  final Bucket bucket;
  final bool isCompleted;

  String get date {
    return formatter.format(dueDate);
  }
}
