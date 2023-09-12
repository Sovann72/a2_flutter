import 'package:a2_tutorial/src/pages/flutter_knowledge/flutter_knowledge.dart';
import 'package:a2_tutorial/src/pages/lessons/asurraa_training/component/component_page.dart';
import 'package:a2_tutorial/src/pages/lessons/asurraa_training/fetch_data_page.dart';
import 'package:a2_tutorial/src/pages/list/lesson_model.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/call_api.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/life_cycle.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/my_video_edit/my_video_edit.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/search_animation.dart';
import 'package:a2_tutorial/src/pages/sura_test/new_tests/translate_animation.dart';
import 'package:a2_tutorial/src/pages/sura_test/sura_test.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/1.1.scaffold_safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2safeArea.dart';
import 'package:a2_tutorial/src/pages/lessons/1.1.scaffold_safeArea/a2scaffold.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/1.2.container_positioning.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2column.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2container.dart';
import 'package:a2_tutorial/src/pages/lessons/1.2.container_position/a2row.dart';
// import 'package:a2_tutorial/src/pages/list/list_of_lesson.dart';
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
import 'package:a2_tutorial/src/pages/flutter_knowledge/didUpdateWidget/didUpdateWidget.dart';
import 'package:a2_tutorial/src/pages/flutter_knowledge/didChangeDependencies/didChangeDependencies.dart';
import 'package:a2_tutorial/src/soriya/onboarding/onboarding_page.dart';
import 'package:a2_tutorial/src/soriya/soriya_page.dart';
// import 'package:a2_tutorial/src/pages/sura_test/sura_test.dart';

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
              title: "download pdf",
              pages: const DownloadPDFPage(
                prop: "sovann",
              )),
          SubLessonModel(
              title: "store and load", pages: const StoreAndLoadImg()),
          SubLessonModel(title: "my search bar", pages: const MySearchBar()),
          SubLessonModel(
              title: "my package info", pages: const MyPackageInfo()),
          SubLessonModel(title: "video editor", pages: const MyVideoEditor()),
          SubLessonModel(
              title: "search with animation", pages: SearchWithAnimation()),
          SubLessonModel(title: "life cycle", pages: LifeCycleScreen()),
          SubLessonModel(
              title: "translate animation", pages: TranslateAnimation()),
          SubLessonModel(title: "calling api", pages: CallingAPIPage())
          // SubLessonModel(title: "test smooth marker", pages: pages)
        ],
      )),
  LessonModel(
      title: "soriya",
      page: SoriyaPage(
        title: "soriya",
        lessons: [
          SubLessonModel(title: "onboarding page", pages: OnboardingPage())
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
          SubLessonModel(title: "change color", pages: const ChangeColorsPage())
        ],
      )),
  LessonModel(
      title: "Flutter Knowledge",
      page: FlutterKnowledge(
        title: "Flutter Knowledge",
        lessons: [
          SubLessonModel(
              title: "didUpdateWidget", pages: DidUpdateWidgetExample()),
          SubLessonModel(
              title: "didChangeDependencies",
              pages: DidChangeDependenciesExample())
        ],
      )),
  LessonModel(
      title: "Asurraa Training",
      page: FlutterKnowledge(
        title: "Asurraa Training",
        lessons: [
          SubLessonModel(title: "component", pages: ComponentPage()),
          SubLessonModel(title: "fetch data", pages: FetchDataPage())
        ],
      )),
  // LessonModel(title: l, page: page)
];
