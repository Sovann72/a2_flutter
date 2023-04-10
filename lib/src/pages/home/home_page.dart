import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/1.1.scaffold_safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2scaffold.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/1.2.container_positioning.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2column.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2container.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2row.dart';
import 'package:a2_tutorial/src/pages/list/list_of_lesson.dart';
import 'package:a2_tutorial/src/pages/onboarding_task/lessons/change_color.dart';
import 'package:a2_tutorial/src/pages/onboarding_task/onboarding_task.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/background_audio.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/download_pdf.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/hive_test.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/material_app_test.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/my_package_info.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/search_bar/search_bar.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/snack_bar_entire_app.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/spectrum_page.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/store_n_load_img.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/test_file.dart';
import 'package:a2_tutorial/src/pages/sura_test/sura_test.dart';
import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  NewWidget({super.key});

  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              number += 1;
            },
            child: Text(number.toString())));
  }
}

class NewStateFul extends StatefulWidget {
  const NewStateFul({super.key});

  @override
  State<NewStateFul> createState() => _NewStateFulState();
}

class _NewStateFulState extends State<NewStateFul> {
  int number = 0;
  // int? unknownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        number += 1;
        setState(() {});
      },
      child: Text(number.toString()),
    );
  }
}

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
            SubLessonModel(title: "video_player", pages: const MyVideoPlayer()),
            SubLessonModel(title: "Hive", pages: const MyHiveTest()),
            SubLessonModel(
                title: "SnackBarEntireAppPage",
                pages: const SnackBarEntireAppPage()),
            SubLessonModel(
                title: "MaterialApp", pages: const MyMaterialAppTest()),
            SubLessonModel(title: "File", pages: const TestFileStoragePage()),
            SubLessonModel(title: "Spectrum", pages: const SpectrumPage()),
            SubLessonModel(
                title: "download pdf", pages: const DownloadPDFPage()),
            SubLessonModel(
                title: "store and load", pages: const StoreAndLoadImg()),
            SubLessonModel(title: "my search bar", pages: const MySearchBar()),
            SubLessonModel(
                title: "my package info", pages: const MyPackageInfo())
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
    LessonModel(
        title: "Onboarding Task",
        page: OnBoardingTask(
          title: "onBoardingTask",
          lessons: [
            SubLessonModel(
                title: "change color", pages: const ChangeColorsPage())
          ],
        ))
    // LessonModel(title: l, page: page)
  ];

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     home: Scaffold(
        //         appBar: AppBar(
        //           title: Text('A2'),
        //         ),
        //         body: Column(
        //           children: [NewStateFul(), NewWidget()],
        //         )
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListView.builder(
          itemCount: listOfLesson.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Card(
                child: ListTile(
                  title: Text(listOfLesson[index].title!),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => listOfLesson[index].page!)));
                  },
                ),
              ),
            );
          }),
    );
    // ));
  }
}
