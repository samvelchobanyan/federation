import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonItem{
  final String name;
  final String place;
  @JsonKey(name: 'profile')
  final String activity;
  @JsonKey(name: 'image')
  final String avatar;

  PersonItem({required this.name, required this.place, required this.activity, required this.avatar}); 

  factory PersonItem.fromJson(Map<String, dynamic> json) => _$PersonItemFromJson(json);
  Map<String,dynamic> toJson() => _$PersonItemToJson(this); 
}