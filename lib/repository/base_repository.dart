import 'dart:convert';

import 'package:dio/dio.dart';

class BaseRepository {
  static String _baseUrl = "http://192.168.0.107:8000";

  static String _appUrl = "$_baseUrl/api";

  get appUrl => _appUrl;

  Dio _dio;
  get dio => _dio;

  BaseRepository() {
    BaseOptions options =
        BaseOptions(receiveTimeout: 50000, connectTimeout: 30000);
    _dio = Dio(options);
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options) async {
          _dio.lock();
          options.headers["Accept"] = "application/json";
          _dio.unlock();
          return options;
        },
      ),
      LogInterceptor(requestBody: true, responseBody: true)
    ]);
  }

  String handleError(error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.DEFAULT:
          errorDescription = "No internet connection";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.RESPONSE:
          errorDescription =
              "Received invalid status code: ${dioError.response?.statusCode}";
          switch (dioError.response?.statusCode) {
            case 401:
              errorDescription = "unauthenticated";
              break;
            case 422:
              if (dioError.response?.data["errors"] != null) {
                var errors = json.encode(dioError.response?.data["errors"]);
                errorDescription = json
                    .decode(errors)
                    .values
                    .toList()
                    .map((v) => v.join("\n"))
                    .join("\n");
              } else if (dioError.response?.data["message"] != null)
                errorDescription = dioError.response?.data["message"];
              else
                errorDescription = dioError.response?.statusMessage;
              break;
            case 500:
              if (dioError.response?.data["message"] != null)
                errorDescription = dioError.response?.data["message"];
              else
                errorDescription = "something went wrong on server";
              break;
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }
}

final BaseRepository baseRepository = BaseRepository();
