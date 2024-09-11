import 'package:flutter_riverpod/flutter_riverpod.dart';

final testListProvider = StateProvider<List<String>>((ref) {
  List<String> lst = ['asd','qwe','zxc'];
  return lst;
});