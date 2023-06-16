import 'package:flutter/material.dart';

import '../../models/todo.dart';

class SelectBox extends StatelessWidget {
  const SelectBox({
    super.key,
    required this.label,
    required this.name,
    required this.onChange,
  });
  final String label;
  final String name;
  final void Function(String label, Bucket value) onChange;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(
          height: 6,
        ),
        DropdownButtonFormField(
          validator: (value) {
            if (value == null || value.name.trim().isEmpty) {
              return '$label is required';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          items: Bucket.values
              .map(
                (bucket) => DropdownMenuItem(
                  value: bucket,
                  child: SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          bucketIcons[bucket],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(bucket.name),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            onChange(name, value!);
          },
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
