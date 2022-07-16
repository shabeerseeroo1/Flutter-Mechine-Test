import 'package:dio/dio.dart';
import 'package:flutter_mechine_test/modules/product/model/product_info.dart';
import 'package:flutter_mechine_test/modules/product/model/product_list_info.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
      receiveTimeout: 15000,
      connectTimeout: 15000,
    );

    dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 200));

    return _ApiClient(dio);
  }

    @GET("products")
    Future<dynamic> getProducts();

  }