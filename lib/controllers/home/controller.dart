import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/views/bookmarks/bookmarks.dart';
import 'package:sputnik/views/courses/courses_page.dart';
import 'package:sputnik/views/home/home_page.dart';

class RootLayoutController extends GetxController {
  late PageController pageController;
  final RxInt currentPage = 0.obs;

  List<Widget> pages = [
    const HomePage(),
    const BookMarksPage(),
    const CoursesPage()
  ]; 

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
