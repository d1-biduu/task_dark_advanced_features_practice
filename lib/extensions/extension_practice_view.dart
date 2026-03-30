import 'package:flutter/material.dart';
import 'package:task_dart_advanced_feature/extensions/extensions.dart';

class ExtensionPracticeView extends StatelessWidget {
  const ExtensionPracticeView({super.key});

  @override
  Widget build(BuildContext context) {
    const text = 'dart';
    const String? nullText = null;
    const person = Person(name: 'Bidisha', surname: 'Koirala', age: 24);

    return Scaffold(
      appBar: AppBar(title: const Text('Dart Extensions Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '--- String Extensions ---',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Original: $text'),
            Text('Capitalize: ${text.capitalize()}'),
            Text('Reversed: ${text.reversed}'),
            Text('Capitalize + Reversed: ${text.capitalize().reversed}'),
            const SizedBox(height: 16),

            const Text(
              '--- Nullable String Extension ---',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Null text orEmpty: "${nullText.orEmpty}"'),
            const SizedBox(height: 16),

            const Text(
              '--- Person Extensions ---',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Full name: ${person.fullName}'),
            Text('Is adult: ${person.isAdult}'),
            Text('Display info: ${person.displayInfo}'),
          ],
        ),
      ),
    );
  }
}
