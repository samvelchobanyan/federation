import 'package:federation/providers/test_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newTest = StateProvider<String>((ref) {
  var a = ref.watch(testProvider);
  return 'this is $a';
});