import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:sputnik/constants/colors.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MColors.foreground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Урок 1",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: MColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                      const SizedBox(height: 20)
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
        ),
      ),
    );
  }
}
