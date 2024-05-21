import 'package:get/get.dart';
import 'package:sputnik/controllers/home/binding.dart';
import 'package:sputnik/views/home/home_layout.dart';
import 'package:sputnik/views/lesson/lesson.dart';

class Pages {
  static const initial = Routes.home;

  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomeLayout(),
      binding: HomeLayoutBinding(),
    ),
    GetPage(
      name: Routes.lesson,
      page: () => LessonPage(),
    )
  ];
}

abstract class Routes {
  Routes._();

  static const home = "/home";
  static const lesson = "/lesson/:index";
}
