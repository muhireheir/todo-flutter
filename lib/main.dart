import 'package:flutter/material.dart';
import 'package:todo/todos.dart';

var kTodoColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(2555, 15, 58, 150),
);
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kTodoColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kTodoColorScheme.onPrimaryContainer,
          foregroundColor: kTodoColorScheme.primaryContainer),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom().copyWith(
            backgroundColor: MaterialStatePropertyAll<Color>(
              kTodoColorScheme.onPrimaryContainer,
            ),
            foregroundColor:
                MaterialStatePropertyAll(kTodoColorScheme.secondaryContainer)),
      ),
    ),
    home: const Todos(),
  ));
}
