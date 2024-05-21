import 'package:get/get.dart';

import 'controller.dart';

class LessonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonController>(() => LessonController());
  }
}
