import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/controllers/home/controller.dart';
import 'package:sputnik/routes/routes.dart';

class Course {
  String name;
  String nameUz;
  int progress;
  Color backgorund;
  bool closed;

  Course(this.name, this.nameUz, this.progress, this.backgorund,
      [this.closed = true]);
}

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
          _buildCoursesList()
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
    final List<Course> courses = [
      Course(
        "Русский алфавит. Буквы и звуки. Ударение",
        "Rus alifbosi. Harf va tovushlar. Urg‘u.",
        75,
        HexColor("#769bfa"),
        false,
      ),
      Course(
        "Русский алфавит. Буквы и звуки. Ударение",
        "Rus alifbosi. Harf va tovushlar. Urg‘u.",
        0,
        MColors.foreground,
      )
    ];

    return Column(
      children: List.generate(
        courses.length,
        (index) => SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              if (!courses[index].closed) {
                Get.toNamed(Routes.lesson);
              }
            },
            child: Card(
              color: courses[index].backgorund,
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
                      "Урок ${index + 1}: ${courses[index].name}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      courses[index].nameUz,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        courses[index].closed
                            ? const Icon(
                                Icons.lock_outline_rounded,
                                size: 20,
                                color: Colors.white70,
                              )
                            : Text(
                                "${courses[index].progress}%",
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
