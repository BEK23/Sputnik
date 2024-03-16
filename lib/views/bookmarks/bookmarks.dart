import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:sputnik/constants/colors.dart";
import "package:sputnik/controllers/home/controller.dart";

class Mark {
  String word;
  String date;

  Mark(this.word, this.date);
}

class BookMarksPage extends GetView<RootLayoutController> {
  const BookMarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            _buildHeader(),
            const SizedBox(height: 20),
            _buildBookMarksList()
          ]),
        ),
      ],
    );
  }

  _buildHeader() {
    return const Center(
      child: Text(
        "Закладки",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  _buildBookMarksList() {
    final List<Mark> marks = [
      Mark("Эксцентричность", "19 февраля"),
      Mark("Эксцентричность", "19 февраля"),
      Mark("Эксцентричность", "19 февраля"),
    ];

    return Column(
      children: List.generate(
        marks.length,
        (index) => SizedBox(
          width: double.infinity,
          child: Card(
            color: MColors.foreground,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    marks[index].word,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    marks[index].date,
                    style: TextStyle(color: MColors.muted),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
