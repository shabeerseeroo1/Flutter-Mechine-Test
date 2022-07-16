import 'package:flutter_mechine_test/contsants/app_strings.dart';
import 'package:flutter_mechine_test/modules/product/model/product_list_info.dart';
import 'package:flutter_mechine_test/web_service/error_handler/error_handler.dart';
import 'package:get/get.dart';

import '../../../utils/snackbar_utils.dart';
import '../../../web_service/client/api_service.dart';

class ProductProvider extends GetConnect {
  Future<List<ProductListInfo?>> getProducts() async {
    var response = await ApiService().getProducts();
    if (response.getException != null) {
      ErrorHandler errorResponse = response.getException;
      CustomSnackBar.showErrorSnackBar(
          AppStrings.error, errorResponse.getErrorMessage());
    } else {
      return response.data?.mProductList ?? [];
    }
    return [];
  }
}
