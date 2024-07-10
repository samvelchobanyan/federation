import 'dart:async';

import 'package:federation/models/persons/person_model.dart';
import 'package:federation/repositories/persons_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final personProvider = FutureProvider((ref) async{
//   final personsList = PersonRepo().getPrsons(limit: 5,ofset: 0);
//   return personsList;
// });
final personsProvider = AsyncNotifierProvider<Persons,List<PersonItem>>(Persons.new);


class Persons extends AsyncNotifier<List<PersonItem>>{
  final pageSize = 10;
  bool _hasMore = true;
  int page = 0;

  bool get hasMore => _hasMore;

  @override
  FutureOr<List<PersonItem>> build() async{
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(_fetchPersons);
    state = newState;
    return newState.value ?? [];
  }

  Future<void> fetchMore() async{
    if(state.isLoading || !_hasMore) return;

    state = const AsyncLoading();

    final newState = await AsyncValue.guard(() async {
      final newPersons = await _fetchPersons();
      return [...?state.value, ...newPersons];
    });

    state = newState;
  }

  Future<List<PersonItem>> _fetchPersons() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    // final result = await PersonRepo().getPrsons(limit: pageSize,ofset: page);
      final result = await ref.read(personsRepoProvider).getPrsons(limit: pageSize,ofset: page);
    
      _hasMore = result.isNotEmpty;
      page = page++;
      

    return result;    
  } 
  
}