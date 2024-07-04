// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonItem _$PersonItemFromJson(Map<String, dynamic> json) => PersonItem(
      name: json['name'] as String,
      place: json['place'] as String,
      activity: json['profile'] as String,
      avatar: json['image'] as String,
    );

Map<String, dynamic> _$PersonItemToJson(PersonItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'place': instance.place,
      'profile': instance.activity,
      'image': instance.avatar,
    };
