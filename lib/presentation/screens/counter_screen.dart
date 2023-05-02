import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counterCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {
                counterCount = 0;
              });
            },
            iconSize: 35,
          ),
        ],
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counterCount', style: const TextStyle(fontSize: 150)),
            Text(counterCount == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 40))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counterCount++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
