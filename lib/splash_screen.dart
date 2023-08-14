import 'dart:convert';

import 'package:a2_tutorial/src/pages/home/home_page.dart';
import 'package:a2_tutorial/src/provider/student_offline_data_provider.dart';
import 'package:a2_tutorial/src/services/file_service.dart';
import 'package:a2_tutorial/src/utilities/one_time/student_model.dart';
import 'package:a2_tutorial/widget/scaffold_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String content = "";

  Future<void> writeData() async {
    final studentProvider =
        Provider.of<StudentOfflineDataProvider>(context, listen: false);
    List<StudentModel> studentData = [
      StudentModel(name: "sovann", age: 19, school: "rupp"),
      StudentModel(age: 20, school: "doe"),
    ];

    List<StudentModel> newData = [
      StudentModel(
        name: "jane",
        age: 21,
        school: "havard",
      ),
      StudentModel(name: "ben", age: 22, school: "stanford")
    ];

    await studentProvider.write(studentData);
  }

  Future<void> onSplashing() async {
    await Future.delayed(const Duration(seconds: 2));
    content = "sovann";
    // Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: MyScaffoldTemplate(
                    title: "Home Page",
                    centerTitle: true,
                    body: MyHomePage(title: "Home")))));
  }

  @override
  void initState() {
    onSplashing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: onSplashing(),
        builder: (context, snap) {
          final connectState = snap.connectionState;

          if (connectState == ConnectionState.none) {
            return waitingWidget();
          } else if (connectState == ConnectionState.waiting) {
            return waitingWidget();
          } else if (connectState == ConnectionState.active) {
            return waitingWidget();
          } else {
            // return Navigator(
            //   onGenerateRoute: ((settings) {
            //     return MaterialPageRoute(
            //         builder: (_) => const MyScaffoldTemplate(
            //               centerTitle: false,
            //               title: "Flutter A2",
            //               body: MyHomePage(title: 'Flutter Demo Home Page'),
            //             ));
            //   }),
            // );
            return SizedBox.shrink();
          }

          // if (snap.hasData) {
          //   return Navigator(
          //     onGenerateRoute: ((settings) {
          //       return MaterialPageRoute(
          //           builder: (_) => const MyScaffoldTemplate(
          //                 centerTitle: false,
          //                 title: "Flutter A2",
          //                 body: MyHomePage(title: 'Flutter Demo Home Page'),
          //               ));
          //     }),
          //   );
          // } else {
          //   // if (snap.connectionState == ConnectionState.waiting) {
          //   return Center(
          //     child: SizedBox(
          //       height: 100,
          //       width: 100,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: const [
          //           SizedBox(
          //               width: 25,
          //               height: 25,
          //               child: CircularProgressIndicator(
          //                 strokeWidth: 2,
          //               )),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text("loading data")
          //         ],
          //       ),
          //     ),
          //   );
          //   // } else if (snap.connectionState == ConnectionState.done) {

          //   // }
          // }

          // return Center(
          //   child: Text(content),
          // );

          // return const MyScaffoldTemplate(
          //   centerTitle: false,
          //   title: "Flutter A2",
          //   body: MyHomePage(title: 'Flutter Demo Home Page'),
          // );
        },
      )),
    );
  }

  Widget waitingWidget() => Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
              SizedBox(
                width: 10,
              ),
              Text("loading data")
            ],
          ),
        ),
      );
}
