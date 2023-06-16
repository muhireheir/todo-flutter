import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/form.dart';
import 'package:todo/widgets/todo_items.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  late List<Todo> todoList;
  @override
  void initState() {
    todoList = [
      Todo(
        title: 'Washing dishes',
        dueDate: DateTime.now(),
        bucket: Bucket.home,
        isCompleted: false,
      ),
      Todo(
        title: 'Raise a pull request',
        dueDate: DateTime.now(),
        bucket: Bucket.work,
        isCompleted: true,
      ),
      Todo(
          title: 'DO some  sports',
          dueDate: DateTime.now(),
          bucket: Bucket.others,
          isCompleted: false),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showTaskForm() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const ItemsForm(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Todo List',
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            TodoItems(
              items: todoList,
            ),
            FloatingActionButton(
              mini: true,
              onPressed: showTaskForm,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
