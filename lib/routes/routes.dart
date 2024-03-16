import 'package:get/get.dart';
import 'package:sputnik/controllers/home/binding.dart';
import 'package:sputnik/views/home/root_layout.dart';

class Pages {
  static const initial = Routes.home;

  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => RootLayout(),
      binding: HomeBinding(),
    )
  ];
}

abstract class Routes {
  Routes._();

  static const home = "/home";
}
