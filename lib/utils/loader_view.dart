import 'package:flutter/material.dart';
import 'package:flutter_mechine_test/utils/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoaderView extends StatelessWidget {
  const LoaderView(
      {Key? key,
      required this.isAsyncCall,
      required this.child,})
      : super(key: key);
  final RxBool isAsyncCall;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        color: Colors.white,
        inAsyncCall: isAsyncCall.value,
        opacity: 0.1,
        progressIndicator: Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const SpinKitSquareCircle(
            color: Colors.white,
            size: 20.0,
          ),
        ),
        child: child
      ),
    );
  }
}
