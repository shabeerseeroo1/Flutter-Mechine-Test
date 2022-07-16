import 'package:flutter_mechine_test/modules/product/model/product_list_info.dart';
import 'package:flutter_mechine_test/modules/product/provider/product_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<ProductListInfo?> mProducts = <ProductListInfo>[].obs;
  late ProductProvider _productProvider;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    init();
    getProducts();
    super.onInit();
  }

  getProducts() {
    _productProvider.getProducts().then((value) {
      mProducts.value = value;
      isLoading(false);
    });
  }

  init() {
    _productProvider = ProductProvider();
  }
}
