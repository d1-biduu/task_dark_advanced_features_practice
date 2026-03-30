import 'package:flutter/material.dart';
import 'package:task_dart_advanced_feature/extensions/extension_practice_view.dart';
import 'package:task_dart_advanced_feature/isolate_practice_screen/isolate_practice_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart Advanced Features')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const IsolatePracticeView(),
                  ),
                );
              },
              child: const Text('Isolate Practice'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ExtensionPracticeView(),
                  ),
                );
              },
              child: const Text('Extension Practice'),
            ),
          ],
        ),
      ),
    );
  }
}
