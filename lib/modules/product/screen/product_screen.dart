import 'package:flutter/material.dart';
import 'package:flutter_mechine_test/common_widgets/custom_appbar.dart';
import 'package:flutter_mechine_test/extension/common_widget.dart';
import 'package:flutter_mechine_test/modules/product/controller/product_controller.dart';
import 'package:flutter_mechine_test/modules/product/widget/product_list_item.dart';
import 'package:flutter_mechine_test/modules/product/widget/product_sheet.dart';
import 'package:flutter_mechine_test/routes/app_pages.dart';
import 'package:flutter_mechine_test/utils/app_colors.dart';
import 'package:flutter_mechine_test/utils/bottom_sheet_utils.dart';
import 'package:flutter_mechine_test/utils/loader_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../contstants/app_strings.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppbar(),
      body: Obx(
        () => _bodyView().paddingCustom(horizontal: 5, vertical: 8)
      ),
    );
  }

  CustomAppbar buildCustomAppbar() {
    return CustomAppbar(
      title:AppStrings.productTitle ,
      backGroundColor: AppColors.primaryColor,
      isHasSettings: true,
      onSettingPress: (){
        Get.toNamed(Routes.settingsScreen);
      },

    );
  }

  LoaderView _bodyView() {
    return LoaderView(
        isAsyncCall: controller.isLoading,
        child:
            controller.mProducts.isNotEmpty ? _alignedGridView() : _emptyView());
  }

  AlignedGridView _alignedGridView() {
    return AlignedGridView.count(
        itemCount: controller.mProducts.length,
        crossAxisCount: 2,
        itemBuilder: (context, index) {
          var item = controller.mProducts[index];
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: () {
              CustomBottomSheet.showBottomSheet(
                  isDismissible: true,
                  ProductSheet(
                      title: item?.title ?? "",
                      price: item?.price.toString() ?? "",
                      description: item?.description ?? "",
                      category: item?.category ?? "",
                      rating: item?.rating?.rate.toString() ?? ""));
            },
            child: ProductListItem(
              image: item?.image ?? "",
              title: item?.title ?? "",
              price: item?.price.toString() ?? "",
            ),
          );
        });
  }

  _emptyView() {
    return Center(
      child: !controller.isLoading.value
          ? const Text(AppStrings.noDataAvailable)
          : Container(),
    );
  }
}
