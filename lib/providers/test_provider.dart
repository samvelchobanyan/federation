import 'package:flutter_riverpod/flutter_riverpod.dart';

final testProvider = StateProvider<int>((ref) {
  return 3;
});