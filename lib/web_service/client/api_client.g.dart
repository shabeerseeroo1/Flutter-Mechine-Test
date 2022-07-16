// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio) {
    baseUrl ??= 'https://fakestoreapi.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> getProducts() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, 'products',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
