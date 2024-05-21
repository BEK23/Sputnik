import 'package:get/get.dart';
import 'package:sputnik/utils/course.dart';
import 'package:sputnik/utils/load_json_from_assets.dart';

class LessonController extends GetxController {
  final RxList<Course> pachters = <Course>[].obs;

  @override
  Future<void> onInit() async {
    final data = await loadStringFromAssets("resources/lesson-1.json");
    pachters.assignAll(courseFromJson(data));

    print('LessonController has been initialized');

    super.onInit();
  }

  @override
  void onClose() {
    print('LessonController has been closed');
    super.onClose();
  }
}
