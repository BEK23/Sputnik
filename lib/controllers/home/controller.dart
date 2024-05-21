import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/utils/course.dart';
import 'package:sputnik/utils/load_json_from_assets.dart';
import 'package:sputnik/views/home/bookmarks/bookmarks.dart';
import 'package:sputnik/views/home/courses/courses_page.dart';
import 'package:sputnik/views/home/dashboard/dashboard_page.dart';
import 'package:sputnik/views/home/notification/notification_page.dart';

class HomeLayoutController extends GetxController {
  late PageController pageController;
  final RxInt currentPage = 0.obs;
  final RxList<Course> courses = <Course>[].obs;

  List<Widget> pages = [
    const DashboardPage(),
    const BookMarksPage(),
    const CoursesPage(),
    const NotificationPage()
  ];

  @override
  Future<void> onInit() async {
    pageController = PageController(initialPage: 0);

    final data = await loadStringFromAssets("resources/lessons.json");
    courses.assignAll(courseFromJson(data));

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
