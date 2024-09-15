import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testListProvider = NotifierProvider<ListNotifier, List<String>>(() {
  return ListNotifier();
});

class ListNotifier extends Notifier<List<String>> {
  @override
  List<String> build(){
    return [];
  }
  // ListNotifier(): super(['asd','qwe','zxc']);

  addItem(newItm){
    debugPrint('add item function');
    state = [...state, newItm];
  }
}