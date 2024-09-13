import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testListProvider = StateNotifierProvider<ListNotifier, List<String>>((ref) {
  return ListNotifier();
});

class ListNotifier extends StateNotifier<List<String>> {
  ListNotifier(): super(['asd','qwe','zxc']);

  addItem(newItm){
    debugPrint('add item function');
    state = [...state, newItm];
  }
}