import 'dart:convert';

class Cow {
  final int id;
  final String name;
  final String description;
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
