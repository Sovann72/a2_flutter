import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/1.1.scaffold_safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2scaffold.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/1.2.container_positioning.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2column.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2container.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2row.dart';
import 'package:a2_tutorial/src/pages/list/list_of_lesson.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/background_audio.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/hive_test.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/snack_bar_entire_app.dart';
import 'package:a2_tutorial/src/pages/sura_test/sura_test.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<LessonModel> listOfLesson = [
    LessonModel(
        title: "Test",
        page: SuraTest(
          title: "Sura Test",
          lessons: [
            SubLessonModel(title: "video_player", pages: MyVideoPlayer()),
            SubLessonModel(title: "Hive", pages: MyHiveTest()),
            SubLessonModel(
                title: "SnackBarEntireAppPage", pages: SnackBarEntireAppPage()),
          ],
        )),
    LessonModel(
      title: "SafeArea and Scaffold",
      page: MyScaffoldSafeArea(
        title: "SafeArea and Scaffold",
        lessons: [
          SubLessonModel(title: "SafeArea", pages: const MySafeArea()),
          SubLessonModel(title: "Scaffold", pages: const MyScaffold()),
        ],
      ),
    ),
    LessonModel(
      title: "Container And Positioning",
      page: MyContainerAndPositioning(
        title: "Container And Positioning",
        lessons: [
          SubLessonModel(title: "Container", pages: const MyContainer()),
          SubLessonModel(title: "Column", pages: const MyColumn()),
          SubLessonModel(title: "Row", pages: const MyRow())
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('A2'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: ListView.builder(
              itemCount: listOfLesson.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Card(
                    child: ListTile(
                      title: Text(listOfLesson[index].title!),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    listOfLesson[index].page!)));
                      },
                    ),
                  ),
                );
              }),
        ));
  }
}
