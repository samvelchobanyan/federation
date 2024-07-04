import 'package:federation/providers/news_provider.dart';
import 'package:federation/providers/persons_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Persons extends ConsumerWidget {
  const Persons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue personsData = ref.watch(personProvider);
    final ScrollController scrollController = ScrollController();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: switch(personsData){            
            AsyncData(:final value) =>  Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: value.length,                
                controller: scrollController,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index){
                  return SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(238, 238, 238, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(value[index].avatar),),
                            Expanded(
                              flex: 7,
                              child: Text(
                                value[index].name,
                                style: const TextStyle(fontFamily: 'Mordoto', fontStyle: FontStyle.italic, fontSize: 14),
                                ),
                            ),
                              const SizedBox(width: 20, child: Icon(Icons.arrow_circle_right_rounded))
                          ],
                        ),
                  ),
                ),
                  );
                }, 
              ),
            ),
            AsyncError()=> const Text('Oops sometheing went wrong'),            
            _=> const CircularProgressIndicator(),
          }
        ),
      ),
    );
  }
  
}