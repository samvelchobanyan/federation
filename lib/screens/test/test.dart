import 'package:federation/providers/test_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleWidget extends StatelessWidget {
  final String txt;
  const TitleWidget( this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(txt);
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        return TextButton(
          child: const Text('click'),
          onPressed: () {
            ref.read(testProvider.notifier).state++;
          },       
        );
      }
    );
  }
}
class Test extends ConsumerWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, WidgetRef ref, child) {
                  final value = ref.watch(testProvider);
                  return TitleWidget(value.toString()); // Hello world
                  }
              ),
              TitleWidget('lalatyrop'),
              ButtonWidget()
            ],
          ),
        )
      ),
    );
  }
}