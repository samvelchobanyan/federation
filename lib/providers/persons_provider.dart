import 'package:federation/repositories/persons_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personProvider = FutureProvider((ref) async{
  final personsList = PersonRepo().getPrsons(limit: 5,ofset: 0);
  return personsList;
});