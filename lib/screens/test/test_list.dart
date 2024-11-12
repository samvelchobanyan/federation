import 'package:federation/providers/test_provider.dart';
import 'package:federation/providers/testlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleWidget extends ConsumerWidget  {
  final String txt;
  const TitleWidget( this.txt, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color clr = Colors.red;
    ref.listen(testProvider,(int? previousCount, int newCount){
      
      // clr= newCount/5 == 5 ? Colors.blue : Colors.red;
      var asd =( newCount%5).toString();
      debugPrint('listen change $asd');
      if(newCount%5 == 0){
        
        ref.refresh(testProvider);
      }
    });
    return Text(
      txt, 
      style:  TextStyle(
        color: clr
      ),
      );
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
            debugPrint('add item');
            ref.read(testListProvider.notifier).addItem('newItm');
          },       
        );
      }
    );
  }
}

class TestList extends ConsumerWidget {
  const TestList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lst = ref.watch(testListProvider);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for ( var i in lst ) Text(i.toString())
                ],
              ),
              const ButtonWidget()              
            ],
            )          
        )
      ),
    );
  }
}