import 'package:federation/models/test/test_model.dart';
import 'package:federation/providers/newtest_provider.dart';
import 'package:federation/providers/test_provider.dart';
import 'package:federation/providers/test_user.dart';
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
            // ref.watch(TestUserNotifierProvider);
            var userid = ref.read(testProvider.notifier).state++;
            ref.read(TestUserNotifierProvider(1).notifier).getNew(userid);
          },       
        );
      }
    );
  }
}

class TestUser extends ConsumerWidget {
  const TestUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsync = ref.watch(TestUserNotifierProvider(1));
    
    return Column(
            children: [
              const ButtonWidget(),
              ElevatedButton(
                onPressed: () => ref.read(TestUserNotifierProvider(1).notifier).getNew(2),
                child: const Text('Fetch joke!'),
              ),
              userDataAsync.when(
                    data: (data) {
                      debugPrint('ui name');
                      debugPrint(data.data!.firstName!);
                       return Text(data.data!.firstName!);
                       }, 
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                ),
            ]          
        );
  }
}