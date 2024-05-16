import 'package:get/get.dart';

import 'controller.dart';

class HomeLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLayoutController>(() => HomeLayoutController());
  }
}
