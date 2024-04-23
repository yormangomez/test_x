class CatImageModel {
  String? id;
  String? url;

  CatImageModel({
    this.id,
    this.url,
  });

  CatImageModel copyWith({
    String? id,
    String? url,
  }) =>
      CatImageModel(
        id: id ?? this.id,
        url: url ?? this.url,
      );

  factory CatImageModel.fromJson(Map<String, dynamic> json) => CatImageModel(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
