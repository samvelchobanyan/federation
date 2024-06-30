
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsItem {
  final String title;
  final String teaser;
  final String body;
  @JsonKey(defaultValue: '/')
  final String image;

  NewsItem({required this.title, required this.teaser, required this.body, required this.image});

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
  Map<String,dynamic> toJson() => _$NewsItemToJson(this);
}