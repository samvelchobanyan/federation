import 'package:federation/providers/news_provider.dart';
import 'package:federation/providers/persons_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Persons extends ConsumerWidget{
  final ScrollController scrollController = ScrollController(); 

  // void loadMore(){
  //   if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {       
  //       debugPrint('end of the list');
  //       ref.watch(personsProvider.notifier).fetchMore();
  //     }
  // }

  personCard(user){
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
                                backgroundImage: NetworkImage(user.avatar),),
                              Expanded(
                                flex: 7,
                                child: Text(
                                  user.name,
                                  style: const TextStyle(fontFamily: 'Mordoto', fontStyle: FontStyle.italic, fontSize: 14),
                                  ),
                              ),
                                const SizedBox(width: 20, child: Icon(Icons.arrow_circle_right_rounded))
                            ],
                          ),
                      ),
                    ),
                  );
  }
  
  _listLoader(bool isInitial){
    // return isInitial ? const CircularProgressIndicator() : const Text('Loading...');    
    return isInitial ? const CircularProgressIndicator() : null;    
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personsData = ref.watch(personsProvider);
    final persons = personsData.value ?? [];
    final initialLoading = personsData.isLoading && persons.isEmpty;

    final paginationController = ref.watch(personsProvider.notifier);
    final hasMore = paginationController.hasMore;
    final isFetchingMore = personsData.isLoading && persons.isNotEmpty;

    // final paginationController = ref.watch(personsProvider.notifier);
    // final hasMore = paginationController.hasMore;
    // final isFetchingMore = personsData.isLoading;
    // var page=1;
    // var isLoading = false;
    

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification){
                  if (notification is ScrollEndNotification &&
                      notification.metrics.extentAfter == 0) {
                    // User has reached the end of the list
                    // Load more data or trigger pagination in flutter
                    
                    if(hasMore && !isFetchingMore){
                      ref.read(personsProvider.notifier).fetchMore();
                    }                    
                    // paginationController.fetchMore();
                  }
                  return false;
                },
                child: 
                initialLoading 
                  ? const CircularProgressIndicator()
                  // : ListView.builder(                      
                  //     // itemCount: personsData.value.length + (!hasMore || isFetchingMore ? 1 : 0),                
                  //     // controller: scrollController,
                  //     // separatorBuilder: (BuildContext context, int index) => const Divider(),
                  //     itemBuilder: (BuildContext context, int index){
                  //       page = index ~/ 10 + 1;
                  //       final indexInPage = index % 10;
                  //       final length = personsData.value.length;
                  //       print('index: $index, page: $page, indexInPage: $indexInPage, length $length');
                  //       if (indexInPage >= personsData.value.length-1) {
                  //           return null;                            
                  //       }

                  //       return personCard(personsData.value[index]);
                  //     }, 
                  //   ),
                  : ListView.separated(
                      itemCount: persons.length + (isFetchingMore ? 1 : 0),
                      separatorBuilder: (BuildContext context, int index) => const Divider(), 
                      itemBuilder: (context, index){
                        if(persons.length == index){
                          if(isFetchingMore){
                            return const CircularProgressIndicator();
                          }else if(!hasMore){
                            return const Text('no more persons');
                          }else{
                            return Container();
                          }
                        }
                        final person = persons[index];
                        return personCard(person);
                      }, 
                    
                    
                    )
                  //  : ListView.separated(                    
                  //     separatorBuilder: (BuildContext context, int index) => const Divider(),
                  //     itemCount: personsData.value.length + (isLoading ? 1 : 0),
                  //     itemBuilder: (BuildContext context, int index){
                  //       if(isLoading){
                  //         return const Text('Loading...');
                  //       }
                  //       return personCard(personsData.value[index]);
                  //     }
                  //   )
                // switch(personsData){
                //   AsyncData(:final value) =>ListView.builder(                      
                //       // itemCount: personsData.value.length + (!hasMore || isFetchingMore ? 1 : 0),                
                //     // controller: scrollController,
                //       // separatorBuilder: (BuildContext context, int index) => const Divider(),
                //       itemBuilder: (BuildContext context, int index){
                //         final indexInPage = index % 10;
                //         if (indexInPage >= personsData.value.length-1) {
                //             return null;
                //         }
                //         return personCard(personsData.value[index]);
                //       }, 
                //     ),
                //   AsyncError(:final error) => Text('Error: $error'),
                //   (_) => _listLoader(personsData.value == null || personsData.value.length == 0)
                // },
              )
              
            ),
        ),
      ),
    );
  }
  
}