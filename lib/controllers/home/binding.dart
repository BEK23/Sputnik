import 'package:get/get.dart';

import 'controller.dart';

class RootLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootLayoutController>(() => RootLayoutController());
  }
}