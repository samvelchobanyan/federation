  import 'package:flutter/material.dart';


class PersonInner extends StatelessWidget {
  const PersonInner(this.id,{super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Persons inner'),
        ),
      ),
    );
  }
}