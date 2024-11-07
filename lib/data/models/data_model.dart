import 'package:work_task/data/models/delivery_time_model.dart';
import 'package:work_task/data/models/lat_long_model.dart';
import 'package:work_task/data/models/shop_working_day_model.dart';
import 'package:work_task/data/models/translation_model.dart';

class Datum {
  final int id;
  final String slug;
  final String uuid;
  final bool open;
  final bool visibility;
  final bool verify;
  final int deliveryType;
  final String backgroundImg;
  final String logoImg;
  final String status;
  final DeliveryTime deliveryTime;
  final LatLong latLong;
  final int minPrice;
  final int maxPrice;
  final int serviceMaxPrice;
  final double distance;
  final int productsCount;
  final Translation translation;
  final List<dynamic> services;
  final List<ShopWorkingDay> shopWorkingDays;
  final List<dynamic> shopClosedDate;
  final int rCount;
  final double rAvg;
  final int serviceMinPrice;

  Datum({
    required this.id,
    required this.slug,
    required this.uuid,
    required this.open,
    required this.visibility,
    required this.verify,
    required this.deliveryType,
    required this.backgroundImg,
    required this.logoImg,
    required this.status,
    required this.deliveryTime,
    required this.latLong,
    required this.minPrice,
    required this.maxPrice,
    required this.serviceMaxPrice,
    required this.distance,
    required this.productsCount,
    required this.translation,
    required this.services,
    required this.shopWorkingDays,
    required this.shopClosedDate,
    required this.rCount,
    required this.rAvg,
    required this.serviceMinPrice,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        uuid: json["uuid"],
        open: json["open"],
        visibility: json["visibility"],
        verify: json["verify"],
        deliveryType: json["delivery_type"],
        backgroundImg: json["background_img"],
        logoImg: json["logo_img"],
        status: json["status"],
        deliveryTime: DeliveryTime.fromJson(json["delivery_time"]),
        latLong: LatLong.fromJson(json["lat_long"]),
        minPrice: json["min_price"],
        maxPrice: json["max_price"],
        serviceMaxPrice: json["service_max_price"],
        distance: json["distance"]?.toDouble(),
        productsCount: json["products_count"],
        translation: Translation.fromJson(json["translation"]),
        services: List<dynamic>.from(json["services"].map((x) => x)),
        shopWorkingDays: List<ShopWorkingDay>.from(
            json["shop_working_days"].map((x) => ShopWorkingDay.fromJson(x))),
        shopClosedDate:
            List<dynamic>.from(json["shop_closed_date"].map((x) => x)),
        rCount: json["r_count"],
        rAvg: json["r_avg"]?.toDouble(),
        serviceMinPrice: json["service_min_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "uuid": uuid,
        "open": open,
        "visibility": visibility,
        "verify": verify,
        "delivery_type": deliveryType,
        "background_img": backgroundImg,
        "logo_img": logoImg,
        "status": status,
        "delivery_time": deliveryTime.toJson(),
        "lat_long": latLong.toJson(),
        "min_price": minPrice,
        "max_price": maxPrice,
        "service_max_price": serviceMaxPrice,
        "distance": distance,
        "products_count": productsCount,
        "translation": translation.toJson(),
        "services": List<dynamic>.from(services.map((x) => x)),
        "shop_working_days":
            List<dynamic>.from(shopWorkingDays.map((x) => x.toJson())),
        "shop_closed_date": List<dynamic>.from(shopClosedDate.map((x) => x)),
        "r_count": rCount,
        "r_avg": rAvg,
        "service_min_price": serviceMinPrice,
      };
}
