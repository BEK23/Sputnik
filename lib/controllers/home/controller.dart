import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late PageController pageController;
  final RxInt currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);

    super.onInit();
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
