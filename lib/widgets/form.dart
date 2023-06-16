import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/widgets/form_controlls/date_picker.dart';
import 'package:todo/widgets/form_controlls/selectbox.dart';
import 'package:todo/widgets/form_controlls/input_field.dart';

class ItemsForm extends StatefulWidget {
  const ItemsForm({super.key});

  @override
  State<ItemsForm> createState() => _ItemsFormState();
}

class _ItemsFormState extends State<ItemsForm> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> formData = {};

  void handleChange(String label, dynamic value) {
    formData[label] = value;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    void closeFormModal() {
      Navigator.pop(context);
    }

    void submitForm() {
      if (_formKey.currentState!.validate()) {
        print(formData);
      }
    }

    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Add new Item',
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InputField(
                label: 'Title',
                onChange: handleChange,
                name: 'title',
              ),
              DateField(
                label: 'Due date',
                name: 'dueDates',
                onChange: handleChange,
              ),
              SelectBox(
                label: 'Bucket',
                name: 'bucket',
                onChange: handleChange,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: ElevatedButton(
                      onPressed: submitForm,
                      child: const Text('Save'),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width * 0.4,
                    child: OutlinedButton(
                      onPressed: closeFormModal,
                      child: const Text('Cancel'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
