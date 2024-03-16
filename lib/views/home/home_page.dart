import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/controllers/home/controller.dart';

class HomePage extends GetView<RootLayoutController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _buildHeader(),
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildWordOfDay(),
          ),
        ),
        SliverToBoxAdapter(child: _buildMyProgress()),
      ],
    );
  }

  _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Привет, Иван!",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              "Уровень: A2",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        CircleAvatar(
          radius: 28,
        )
      ],
    );
  }

  _buildWordOfDay() {
    const words = ["Эксцентричность", "Эксцентричность", "Эксцентричность"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Слово дня",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        Wrap(
          children: List.generate(
            words.length,
            (index) => Container(
              width: double.infinity,
              height: 48,
              padding: const EdgeInsets.only(left: 20),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  color: MColors.foreground,
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    words[index],
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: HexColor("#616874"),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(-4, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildMyProgress() {
    final items = [HexColor("#769bfa"), HexColor("#505255"), MColors.foreground];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Мой прогресс",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  color: items[index],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 240,
                    alignment: Alignment.center,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
