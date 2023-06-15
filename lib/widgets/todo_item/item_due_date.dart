import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class DueDate extends StatelessWidget {
  const DueDate({super.key, required this.item});
  final Todo item;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    var diffInDays = now.difference(item.dueDate).inDays;

    var color = item.isCompleted == true
        ? const Color.fromARGB(255, 5, 148, 108)
        : (diffInDays < 1 ? Colors.orange : Colors.black45);

    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: 15,
          color: color,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          item.date,
          style: TextStyle(
            fontSize: 10,
            color: color,
          ),
        )
      ],
    );
  }
}
