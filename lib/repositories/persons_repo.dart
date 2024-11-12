import 'package:dio/dio.dart';
import 'package:federation/constants.dart' as constants;
import 'package:federation/models/persons/person_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonRepo{
  Future getPrsons({int ofset = 0,int limit = 5}) async {
    final response = await Dio().post(
      'http://${constants.apiUrl}/users.php',
      queryParameters: {'ofset': 0, 'limit': 10},
    );

    final resp = response.data;

    if(resp['status'] == 'ok'){
      final data = resp['data'] as List;
      List<PersonItem> newsList = [];

      for (var i = 0; i < data.length; i++) {
        newsList.add(PersonItem.fromJson(data[i]));
      }
      return newsList;
    }
  }
}

final personsRepoProvider = Provider<PersonRepo>((ref)=>PersonRepo());