import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mechine_test/modules/product/model/product_info.dart';
import 'package:flutter_mechine_test/web_service/error_handler/error_handler.dart';
import 'package:flutter_mechine_test/web_service/generic/base_model.dart';

import 'api_client.dart';

class ApiService {
  late Dio dio;
  late ApiClient client;

  ApiService() {
    dio = Dio();
    client = ApiClient(dio);
  }

  Future<BaseModel<ProductInfo>> getProducts() async {
    ProductInfo response;
    try {
      dynamic dynamicData = await client.getProducts();
      var jsonString = "{\"product_list\": ${jsonEncode(dynamicData)}}";
      response = ProductInfo.fromJson(json.decode(jsonString));
    } catch (e) {
      return BaseModel()
        ..setException(ErrorHandler.withErrorAndCode(error: e as DioError));
    }
    return BaseModel()..data = response;
  }
}
