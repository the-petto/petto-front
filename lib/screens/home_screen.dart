import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "🐶",
                  style: TextStyle(fontSize: 100),
                ),
                Text(
                  "PETTO",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
