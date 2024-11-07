class LatLong {
  final double latitude;
  final double longitude;

  LatLong({
    required this.latitude,
    required this.longitude,
  });

  factory LatLong.fromJson(Map<String, dynamic> json) => LatLong(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
