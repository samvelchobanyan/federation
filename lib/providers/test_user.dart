import 'dart:async';

import 'package:dio/dio.dart';
import 'package:federation/models/test/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final TestUserNotifierProvider = AsyncNotifierProvider<TestUserNotifier,TestModel>(TestUserNotifier.new);

class TestUserNotifier extends  AsyncNotifier<TestModel>{

   Future<TestModel> fetchSome(userid) async{
    final response = await Dio().get(
      'https://reqres.in/api/users/$userid',
    );
    debugPrint('fetchsome$userid');
    final dataJson = response.data;
    return TestModel.fromJson(dataJson);
  }

  @override
  FutureOr<TestModel> build(){
    return fetchSome(1);
  }
 
}

