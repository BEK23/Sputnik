import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/views/home/bookmarks/bookmarks.dart';
import 'package:sputnik/views/home/courses/courses_page.dart';
import 'package:sputnik/views/home/dashboard/dashboard_page.dart';
import 'package:sputnik/views/home/notification/notification_page.dart';

class HomeLayoutController extends GetxController {
  late PageController pageController;
  final RxInt currentPage = 0.obs;

  List<Widget> pages = [
    const DashboardPage(),
    const BookMarksPage(),
    const CoursesPage(),
    const NotificationPage()
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
