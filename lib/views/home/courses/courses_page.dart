import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/controllers/home/controller.dart';

class CoursesPage extends GetView<HomeLayoutController> {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          _buildHeader(),
          const SizedBox(height: 20),
          _buildCoursesList(),
          const SizedBox(height: 100),
        ]))
      ],
    );
  }

  _buildHeader() {
    return const Center(
      child: Text(
        "Курс",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  _buildCoursesList() {
    final courses = controller.courses;

    return Column(
      children: List.generate(
        courses.length,
        (index) => SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              if (courses[index].closed == false) {
                Get.toNamed(
                  "/lesson/${index + 1}",
                  arguments: {
                    "title": courses[index].titleRu,
                  },
                );
              }
            },
            child: Card(
              color: HexColor(courses[index].backgroud),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 14),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Урок ${index + 1}: ${courses[index].titleRu}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      courses[index].titleUz,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        courses[index].closed != false
                            ? const Icon(
                                Icons.lock_outline_rounded,
                                size: 20,
                                color: Colors.white70,
                              )
                            : Text(
                                "${courses[index].progress ?? 0}%",
                                style: const TextStyle(color: Colors.white70),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
