import 'package:dio/dio.dart';

import 'package:ryc_desafio_do_modulo_basico/core/http/http_core.dart';

class HttpCoreImpl implements HttpCore {
  final Dio dio;

  HttpCoreImpl({
    required this.dio,
  });

  @override
  Future<void> get(String path, {Object? data}) {
    return dio.post(path, data: data);
  }

  @override
  Future<void> post(String path, {Object? data}) {
    return dio.get(path, data: data);
  }
}
