class ShopWorkingDay {
  final int id;
  final String day;
  final String from;
  final String to;
  final bool disabled;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShopWorkingDay({
    required this.id,
    required this.day,
    required this.from,
    required this.to,
    required this.disabled,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShopWorkingDay.fromJson(Map<String, dynamic> json) => ShopWorkingDay(
        id: json["id"],
        day: json["day"],
        from: json["from"],
        to: json["to"],
        disabled: json["disabled"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "from": from,
        "to": to,
        "disabled": disabled,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
