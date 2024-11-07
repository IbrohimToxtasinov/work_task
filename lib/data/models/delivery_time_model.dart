class DeliveryTime {
  final String to;
  final String from;
  final String type;

  DeliveryTime({
    required this.to,
    required this.from,
    required this.type,
  });

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
        to: json["to"],
        from: json["from"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "from": from,
        "type": type,
      };
}
