import 'package:dio/dio.dart';
import 'package:miguel_cauich_app/config/api/api_endpoints.dart';

class ApiClient {
  static final Dio _instance = Dio();
  static Dio get instance => _instance;

  static void setup() {
    _instance
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..options.responseType = ResponseType.json
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
    _instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  static Future<void> _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers['Authorization'] = 'Bearer ${ApiEndpoints.apiKey}';
        options.queryParameters = {"token" : ApiEndpoints.apiToken };

    return handler.next(options);
  }

  static Future<void> _onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    print('Body: ${response.data}');
    return handler.next(response);
  }

  static Future<void> _onError(
      DioException error, ErrorInterceptorHandler handler) async {
    return handler.next(error);
  }
}
