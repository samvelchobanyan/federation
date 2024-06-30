import 'package:flutter/material.dart';


class Persons extends StatelessWidget {
  const Persons({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Persons'),
        ),
      ),
    );
  }
}