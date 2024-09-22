import 'package:dio/dio.dart';
import 'package:federation/models/test/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class testUserProvider = AsyncNotifier<TestModel>{
  @override
  Future<TestModel> build(){
    _fetchsome();
  }

  Future<TestModel> _fetchSome(){
    final response = await Dio().get(
      'https://reqres.in/api/users/$userid',
    );
    final dataJson = response.data;
    return TestModel.fromJson(dataJson);
  }
  
    
  
};