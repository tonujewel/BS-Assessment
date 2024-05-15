import 'dart:developer';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = "";
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.connectionError:
        message = "NoInternet";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = apiErrorMessage(dioError);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String apiErrorMessage(exception) {
    if (exception.runtimeType == DioException) {
      var dioException = exception as DioException;
      var error = dioException.response!; // Do something with response
      log(error.toString());
    }

    return "";
  }

  @override
  String toString() => message;
}
