import 'package:test_x/feature/home/data/model/cat_image_model.dart';

class CatModel {
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? description;
  String? wikipediaUrl;
  String? origin;
  String? lifeSpan;
  int? intelligence;
  bool select;

  CatModel({
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.description,
    this.wikipediaUrl,
    this.origin,
    this.lifeSpan,
    this.intelligence,
    this.select = false,
  });

  CatModel copyWith({
    String? id,
    String? name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    String? description,
    String? wikipediaUrl,
    String? origin,
    String? lifeSpan,
    int? intelligence,
    bool? select,
  }) =>
      CatModel(
        id: id ?? this.id,
        name: name ?? this.name,
        cfaUrl: cfaUrl ?? this.cfaUrl,
        vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
        vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
        description: description ?? this.description,
        wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
        origin: origin ?? this.origin,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        intelligence: intelligence ?? this.intelligence,
        select: select ?? this.select,
      );

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
        id: json["id"],
        name: json["name"],
        cfaUrl: json["cfa_url"],
        vetstreetUrl: json["vetstreet_url"],
        vcahospitalsUrl: json["vcahospitals_url"],
        description: json["description"],
        wikipediaUrl: json["wikipedia_url"],
        origin: json["origin"],
        lifeSpan: json["life_span"],
        intelligence: json["intelligence"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cfa_url": cfaUrl,
        "vetstreet_url": vetstreetUrl,
        "vcahospitals_url": vcahospitalsUrl,
        "description": description,
        "wikipedia_url": wikipediaUrl,
        "origin": origin,
        "life_span": lifeSpan,
        "intelligence": intelligence,
      };
}

class Image {
  String? id;
  String? url;

  Image({
    this.id,
    this.url,
  });

  Image copyWith({
    String? id,
    String? url,
  }) =>
      Image(
        id: id ?? this.id,
        url: url ?? this.url,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
