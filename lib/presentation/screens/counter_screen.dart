import 'dart:ffi';

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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  counterCount = 0;
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  counterCount++;
                });
              },
            ),
            const SizedBox(height: 15),
            CustomButton(
              icon: Icons.exposure_minus_1,
              isStadiumBorder: true,
              onPressed: () {
                setState(() {
                  if (counterCount > 0) {
                    counterCount--;
                  }
                });
              },
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final bool isStadiumBorder;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.isStadiumBorder = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      onPressed: onPressed,
      shape: isStadiumBorder ? const StadiumBorder() : null,
      child: Icon(icon),
    );
  }
}
