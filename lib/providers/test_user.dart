import 'package:dio/dio.dart';
import 'package:federation/models/test/test_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testUserProvider = FutureProvider.family<TestModel,int>((ref,userid) async {

  final response = await Dio().get(
      'https://reqres.in/api/users/$userid',
    );
    
  final dataJson = response.data;
  return TestModel.fromJson(dataJson);
});