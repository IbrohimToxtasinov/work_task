import 'package:dio/dio.dart';
import 'package:work_task/data/models/lat_long_model.dart';
import 'package:work_task/data/models/my_response/my_response.dart';
import 'package:work_task/data/models/search_model.dart';
import 'package:work_task/services/network/api_service/open_api/open_api_client.dart';

class OpenApiService extends OpenApiClient {
  Future<MyResponse> getShops({required LatLong latLong}) async {
    MyResponse appResponse = MyResponse();
    try {
      Response response = await dio.get(queryParameters: {
        "lang": "en",
        "location_type": 2,
        "column": "distance",
        "sort": "asc",
        "address%5Blatitude%5D": latLong.latitude,
        "address%5Blongitude%5D": latLong.longitude,
      }, "${dio.options.baseUrl}/api/v1/rest/shops/paginate");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        appResponse.data = SearchModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioException) {
        appResponse.errorMessage =
            "${e.response?.data["title"]} ${e.response?.data["detail"]}";
        appResponse.statusCode = e.response?.statusCode;
      } else {
        appResponse.errorMessage = e.toString();
      }
    }
    return appResponse;
  }
}
