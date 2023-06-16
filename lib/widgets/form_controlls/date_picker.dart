// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var dateFormatter = DateFormat.yMd();

class DateField extends StatefulWidget {
  const DateField({
    super.key,
    required this.label,
    required this.name,
    required this.onChange,
  });
  final String label;
  final String name;
  final void Function(String label, String value) onChange;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  var dateInputController = TextEditingController();

  void onTap() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year, now.month, now.day);
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 50),
    );
    setState(() {
      dateInputController.text = dateFormatter.format(pickedDate!);
      widget.onChange(widget.name, dateInputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: dateInputController,
          onTap: onTap,
          readOnly: true,
          decoration: const InputDecoration(
            hintText: 'dd/mm/yyyy',
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '${widget.label} is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
