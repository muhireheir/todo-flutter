import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item/item_due_date.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.item});

  final Todo item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.title),
      background: const ColoredBox(
        color: Color.fromARGB(23, 16, 154, 140),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 13, 151, 137),
            ),
          ),
        ),
      ),
      secondaryBackground: const ColoredBox(
        color: Color.fromARGB(49, 246, 15, 50),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.delete,
                color: Color.fromARGB(251, 246, 15, 50),
              )),
        ),
      ),
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        return direction == DismissDirection.endToStart ? true : false;
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                bucketIcons[item.bucket],
                size: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.quicksand(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DueDate(
                    item: item,
                  ),
                ],
              ),
              const Spacer(),
              PopupMenuButton(
                itemBuilder: (contenxt) => [
                  PopupMenuItem(
                    height: 10,
                    child: Text(
                      item.isCompleted
                          ? 'mark as un completed'
                          : 'mark as completed',
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
