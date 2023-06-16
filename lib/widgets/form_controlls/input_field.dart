// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.label,
      required this.name,
      required this.onChange});
  final String label;
  final String name;
  final void Function(String label, String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          onChanged: (value) {
            onChange(name, value);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return '$label is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
