import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';
import 'package:sputnik/views/root_layout.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

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
          "${Get.arguments['title']}",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('resources/lesson-1-1.html'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SelectionArea(
                    child: HtmlWidget(snapshot.data,
                        customStylesBuilder: (element) {
                      if (element.classes.contains('title')) {
                        return {
                          'color': 'white',
                          'text-align': 'center',
                        };
                      }
                      if (element.classes.contains('subtitle')) {
                        return {
                          'color': 'white',
                          'font-size': '16px',
                          'fontWeight': 'normal',
                          "text-align": "center",
                        };
                      }
                      if (element.localName == 'h4') {
                        return {
                          'color': 'white',
                          'font-size': '16px',
                        };
                      }

                      if (element.localName == 'table') {
                        return {
                          'color': 'white',
                          'border': '1px solid white',
                          'border-collapse': 'collapse',
                        };
                      }
                      if (element.localName == 'th') {
                        return {
                          'color': 'white',
                          'background-color': 'gray',
                          'padding': '8px',
                          'text-align': 'left',
                          'border': '1px solid white',
                        };
                      }
                      if (element.localName == 'td') {
                        return {
                          'color': 'white',
                          'padding': '8px',
                          'text-align': 'left',
                          'border': '1px solid white',
                        };
                      }

                      return {'color': 'white', 'fontSize': '16px'};
                    }),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // Add logic for navigating to the next chapter
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MColors.foreground),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: const Row(
                          children: [
                            Text('Далее'),
                            Icon(
                              Icons.chevron_right,
                              size: 18,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
