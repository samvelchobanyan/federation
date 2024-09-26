import 'dart:async';

import 'package:dio/dio.dart';
import 'package:federation/models/test/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final TestUserNotifierProvider = AsyncNotifierProvider.autoDispose.family<TestUserNotifier,TestModel,int>(TestUserNotifier.new);

class TestUserNotifier extends AutoDisposeFamilyAsyncNotifier<TestModel, int>{

   Future<TestModel> fetchSome(userid) async{
    final response = await Dio().get(
      'https://reqres.in/api/users/$userid',
    );
    debugPrint('fetchsome$userid');
    final dataJson = response.data;
    return TestModel.fromJson(dataJson);
  }

  getNew(id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return fetchSome(id);
      });
  }

  @override
  Future<TestModel> build(int id){
    return fetchSome(id);
  }
 
}

