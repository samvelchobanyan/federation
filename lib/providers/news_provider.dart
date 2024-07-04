import 'package:federation/repositories/news_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsProvider = FutureProvider((ref) async {
  return NewsRepo().getNews(limit: 5,ofset: 0);
});