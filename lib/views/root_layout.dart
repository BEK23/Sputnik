import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/controllers/home/controller.dart';

class RootLayout extends StatelessWidget {
  RootLayout({super.key});

  final RootLayoutController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.background,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _homeController.pageController,
              children: [..._homeController.pages],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: MColors.foreground,
                    borderRadius: BorderRadius.circular(36)),
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _bottomAppBarItem(
                          icon: Icons.home_rounded,
                          page: 0,
                        ),
                        _bottomAppBarItem(
                          icon: Icons.bookmark_rounded,
                          page: 1,
                        ),
                        _bottomAppBarItem(
                          icon: Icons.menu_book_rounded,
                          page: 2,
                        ),
                        _bottomAppBarItem(
                          icon: Icons.notifications_rounded,
                          page: 3,
                        ),
                        _bottomAppBarItem(
                          icon: Icons.person_rounded,
                          page: 4,
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      )),
    );
  }

  _bottomAppBarItem({required IconData icon, required int page}) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: _homeController.currentPage.value == page
          ? MColors.success
          : Colors.transparent,
      child: IconButton(
        onPressed: () => _homeController.goToTab(page),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          icon,
          size: _homeController.currentPage.value == page ? 28 : 24,
          color: _homeController.currentPage.value == page
              ? MColors.foreground
              : Colors.white,
        ),
      ),
    );
  }
}
