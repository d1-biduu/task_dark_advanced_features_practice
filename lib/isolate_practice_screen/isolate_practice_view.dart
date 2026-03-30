import 'dart:isolate';
import 'package:flutter/material.dart';

class IsolatePracticeView extends StatefulWidget {
  const IsolatePracticeView({super.key});

  @override
  State<IsolatePracticeView> createState() => _IsolatePracticeViewState();
}

class _IsolatePracticeViewState extends State<IsolatePracticeView> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 40),

              Text(result.isEmpty ? "No result yet" : result),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  var data = calculateSumOnMainThread();
                  setState(() {
                    result = "Main thread: $data";
                  });
                },
                child: const Text("Without Isolates"),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();

                  await Isolate.spawn(
                    calculateSumOnDifferentIsolate,
                    receivePort.sendPort,
                  );

                  final message = await receivePort.first;

                  setState(() {
                    result = "Isolate: $message";
                  });

                  receivePort.close();
                },
                child: const Text("With Isolates"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int calculateSumOnMainThread() {
    int sum = 0;

    for (int i = 0; i < 300000000; i++) {
      sum += i;
    }

    return sum;
  }
}

void calculateSumOnDifferentIsolate(SendPort sendPort) {
  int sum = 0;

  for (int i = 0; i < 300000000; i++) {
    sum += i;
  }

  sendPort.send(sum);
}
