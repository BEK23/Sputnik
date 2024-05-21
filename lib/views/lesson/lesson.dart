import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/controllers/lesson/controller.dart';
import 'package:sputnik/views/root_layout.dart';

class LessonPage extends StatelessWidget {
  LessonPage({super.key});

  final LessonController _lessonController = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      appBar: AppBar(
        backgroundColor: MColors.foreground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          // "${Get.arguments['title']}",
          "",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(() {
              if (_lessonController.pachters.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: _lessonController.pachters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // if (_lessonController.pachters[index].closed != false) {
                      //   Get.toNamed(
                      //     "/chapter/${index + 1}",
                      //     arguments: {
                      //       "title": _lessonController.pachters[index].titleRu,
                      //     },
                      //   );
                      // }
                    },
                    child: Card(
                      color:
                          HexColor(_lessonController.pachters[index].backgroud),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.only(bottom: 14),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Урок ${index + 1}: ${_lessonController.pachters[index].titleRu}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _lessonController.pachters[index].titleUz,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _lessonController.pachters[index].closed !=
                                        false
                                    ? const Icon(
                                        Icons.lock_outline_rounded,
                                        size: 20,
                                        color: Colors.white70,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Card(
            color: MColors.foreground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 14),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Задачи",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.lock_outline_rounded,
                        size: 20,
                        color: Colors.white70,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
