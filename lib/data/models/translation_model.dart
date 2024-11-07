class Translation {
  final int id;
  final String locale;
  final String title;
  final String description;
  final String address;

  Translation({
    required this.id,
    required this.locale,
    required this.title,
    required this.description,
    required this.address,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        locale: json["locale"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "title": title,
        "description": description,
        "address": address,
      };
}
