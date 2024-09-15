import 'package:flutter/material.dart';

class TestModel {
  UserData? data;
  Support? support;

  TestModel( {
    this.data,
    this.support,
  });

  factory TestModel.fromJson(Map<String,dynamic> json) { 
     debugPrint(json["data"]["first_name"]);
    return TestModel(
      data: UserData.fromJson(json["data"]),
      support: Support.fromJson(json["support"]),
    );
  }

  Map<String,dynamic> toJson() => {
    "data": data!.toJson(),
    "support": support!.toJson(),
  };

}

class UserData {
  UserData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}