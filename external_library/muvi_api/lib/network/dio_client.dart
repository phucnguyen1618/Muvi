import 'dart:async';

import 'package:dio/dio.dart';

class DioClient {
  static late Dio _dio;

  static FutureOr<Dio> setUpClient({required String baseUrl}) async {
    final options = BaseOptions(
      headers: {
        'Content-type': 'application/json',
      },
      contentType: 'application/json',
      responseType: ResponseType.json,
      baseUrl: baseUrl,
      receiveTimeout: 30000,
      connectTimeout: 30000,
    );

    _dio = Dio(options);
    return _dio;
  }

  static Dio get dio => _dio;
}
