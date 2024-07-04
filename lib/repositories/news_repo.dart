import 'package:dio/dio.dart';
import 'package:federation/constants.dart' as constants;
import 'package:federation/models/news/news_model.dart';

class NewsRepo {
  Future getNews({int ofset = 0,int limit = 5}) async {
    final response = await Dio().post(
      'http://${constants.apiUrl}/news.php',
      queryParameters: {'ofset': 0, 'limit': 5},
    );

    final resp = response.data;

    if(resp['status'] == 'ok'){
      final data = resp['data'] as List;
      List<NewsItem> newsList = [];

      for (var i = 0; i < data.length; i++) {
        newsList.add(NewsItem.fromJson(data[i]));
      }
      return newsList;
    }
  }
  
}