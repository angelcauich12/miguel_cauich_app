import 'package:dio/dio.dart';

class ServerException implements Exception {}

class NetworkException implements Exception {
  final String message;
  final int? code;

  const NetworkException({required this.message, this.code});

  const NetworkException.invalidBaseUrl({this.code})
      : message = "Base URL not found or invalid";

  const NetworkException.unexpectedError({this.code})
      : message = "Unexpected error occurred";

  factory NetworkException.fromDioError(DioException error) {
    final responseData = error.response?.data;
    String message = error.message ?? "Server error";

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException(
            message: "Connection timeout", code: error.response?.statusCode);
      case DioExceptionType.receiveTimeout:
        return NetworkException(
            message: "Receive timeout", code: error.response?.statusCode);
      case DioExceptionType.sendTimeout:
        return NetworkException(
            message: "Send timeout", code: error.response?.statusCode);
      case DioExceptionType.badResponse:
        if (responseData != null && responseData is Map<String, dynamic>) {
          message = responseData['error'] ?? responseData['message'] ?? message;
        } else if (responseData != null && responseData is String) {
          message = responseData;
        }
        return NetworkException(
            message: message, code: error.response?.statusCode);
      case DioExceptionType.connectionError:
        return NetworkException(
            message: "No internet connection",
            code: error.response?.statusCode);
      default:
        return NetworkException(
            message: error.message ?? "Unexpected network error",
            code: error.response?.statusCode);
    }
  }
}

class CacheException implements Exception {}
