// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) => NewsItem(
      title: json['title'] as String,
      teaser: json['teaser'] as String,
      body: json['body'] as String,
      image: json['image'] as String? ?? '/',
    );

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'title': instance.title,
      'teaser': instance.teaser,
      'body': instance.body,
      'image': instance.image,
    };
