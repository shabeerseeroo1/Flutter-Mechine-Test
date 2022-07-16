import 'package:flutter_mechine_test/modules/product/model/product_list_info.dart';

class ProductInfo {
  List<ProductListInfo>? mProductList;

  ProductInfo.fromJson(Map<String, dynamic> json) {
    if (json['product_list'] != null) {
      mProductList = <ProductListInfo>[];
      json['product_list'].forEach((v) {
        mProductList?.add(ProductListInfo.fromJson(v));
      });
    }
  }
}
