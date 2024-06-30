import 'package:federation/models/news_model.dart';
import 'package:federation/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class News extends ConsumerWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue newsList = ref.watch(newsProvider);

    _newslList(newsList){
      return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: newsList.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index){
                  return SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox.fromSize(
                                size: Size.fromHeight(128),
                                child: Image.network(
                                    newsList[index].image,
                                    fit: BoxFit.fitWidth,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 20,),    
                            Text(
                              newsList[index].title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontFamily: 'Mordoto', fontStyle: FontStyle.italic, fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            const SizedBox(height: 20,),  
                            Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    newsList[index].teaser,
                                    style: const TextStyle(fontFamily: 'Mordoto', fontStyle: FontStyle.italic, fontSize: 14),
                                    ),
                                ),
                                  const SizedBox(width: 20, child: const Icon(Icons.arrow_circle_right_rounded))
                              ],
                            ),
                        ],),
                      ),
                    ),
                  );
              })

              );
    }
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: switch(newsList){
            AsyncData(:final value) => _newslList(value),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const CircularProgressIndicator(),
          } 
        ),
      ),
    );
  }
}