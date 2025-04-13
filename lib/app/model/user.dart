// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'image.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String fullName;
    String email;
    String? age;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic publishedAt;
    dynamic? image;

    User({
        required this.id,
        required this.fullName,
        required this.email,
        this.age,
        required this.createdAt,
        required this.updatedAt,
        this.publishedAt,
        this.image,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        age: json["age"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"],
        // image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "age": age,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt,
        // "image": image.url,
    };
}
