  import 'package:flutter/material.dart';


class NewsInner extends StatelessWidget {
  const NewsInner(this.id,{super.key});
  final String id;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('News Inner'),
        ),
      ),
    );
  }
}