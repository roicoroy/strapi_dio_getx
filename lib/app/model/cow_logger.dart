import 'dart:convert';

import 'package:hive/hive.dart';

part 'cow_logger.g.dart';

@HiveType(typeId: 5)
class Cow {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;

  Cow({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
  });

  List<Cow> cowListFromJson(String val) => List<Cow>.from(
    json.decode(val)['data'].map((val) => Cow.cowFromJson(val)),
  );

  factory Cow.cowFromJson(Map<String, dynamic> data) => Cow(
    id: data['id'],
    name: data['attributes']['name'],
    description: data['attributes']['description'],
    images: List<String>.from(
      data['attributes']['images']['data'].map(
        (image) => image['attributes']['url'],
      ),
    ),
  );
}
