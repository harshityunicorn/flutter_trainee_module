import 'dart:isolate';
import 'package:flutter/material.dart';

class Isolates extends StatefulWidget {
  const Isolates({super.key});

  @override
  State<Isolates> createState() => _IsolatesState();
}

class _IsolatesState extends State<Isolates> {
  String result = 'Press button to calculate';
  bool isLoading = false;

  static void heavyComputation(SendPort sendPort) {
    // Simulate heavy work: calculate sum of large numbers
    int sum = 0;
    for (int i = 0; i < 1000000000; i++) {
      sum += i;
    }

    // Send result back to main isolate
    sendPort.send(sum);
  }

  Future<void> runHeavyTask() async {
    final receiveport = ReceivePort();
    await Isolate.spawn(heavyComputation, receiveport.sendPort);

    receiveport.listen((message) {
      setState(() {
        result = 'Result: $message';
        isLoading = false;
      });
      receiveport.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Isolates Example')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              if (isLoading)
                const CircularProgressIndicator()
              else ...[
                ElevatedButton(
                  onPressed: runHeavyTask,
                  child: const Text('Run Heavy Task (Isolate.spawn)'),
                ),
              ],
              const SizedBox(height: 40),
              const Text(
                'Try scrolling or interacting while calculation runs!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              // Add some scrollable content to test UI responsiveness
              Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Item $index'),
                        subtitle: const Text('UI stays responsive'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
