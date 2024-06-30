import 'package:dio/dio.dart';
import 'package:federation/constants.dart' as constants;
import 'package:federation/models/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider = FutureProvider((ref) async {
  final response = await Dio().post(
    'http://${constants.apiUrl}/news.php',
      queryParameters: {'ofset': 0, 'limit': 5},
  );
  final res = response.data;

  if(res['status'] == 'ok'){
    final data = res['data'] as List;
    List<NewsItem> newsList = [];

    for (var i = 0; i < data.length; i++) {
      newsList.add(NewsItem.fromJson(data[i]));
    }
    return newsList;
  }
});