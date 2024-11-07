import 'package:work_task/data/models/data_model.dart';
import 'package:work_task/data/models/links_model.dart';
import 'package:work_task/data/models/meta_model.dart';

class SearchModel {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  SearchModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}
