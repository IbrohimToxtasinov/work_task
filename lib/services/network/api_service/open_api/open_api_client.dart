import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:work_task/services/network/api_service/custom_exceptions.dart';
import 'package:work_task/utils/constants.dart';

class OpenApiClient {
  OpenApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 35000),
        receiveTimeout: const Duration(milliseconds: 33000)));
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: ((error, handler) {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
              throw DeadlineExceededException(error.requestOptions);
            case DioExceptionType.receiveTimeout:
              throw ReceiveTimeOutException(error.requestOptions);
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                // case 401:
                //   throw UnauthorizedException(error.requestOptions);
                // case 404:
                //   throw NotFoundException(error.requestOptions);
                // case 409:
                //   throw ConflictException(error.requestOptions);
                // case 500:
                // case 501:
                // case 503:
                //   throw InternalServerErrorException(error.requestOptions);
              }
              break;
            case DioExceptionType.cancel:
              throw CancelException(error.requestOptions);
            case DioExceptionType.badCertificate:
              throw BadCertificateException(error.requestOptions);
            case DioExceptionType.connectionError:
              throw NoInternetConnectionException(error.requestOptions);
            case DioExceptionType.unknown:
              throw UnknownException(error.requestOptions);
          }
          debugPrint('Error Status Code:${error.response?.statusCode}');
          return handler.next(error);
        }),
        onRequest: (requestOptions, handler) {
          return handler.next(requestOptions);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          debugPrint("Response has received: ${response.data}");
          return handler.next(response);
        },
      ),
    );
  }
}
