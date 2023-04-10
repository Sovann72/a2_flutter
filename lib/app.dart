import 'package:a2_tutorial/splash_screen.dart';
import 'package:a2_tutorial/src/pages/home/home_page.dart';
import 'package:a2_tutorial/src/provider/search_file_provider.dart';
import 'package:a2_tutorial/src/provider/student_offline_data_provider.dart';
import 'package:a2_tutorial/widget/scaffold_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentOfflineDataProvider()),
        ChangeNotifierProvider(create: (_) => SearchFileProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: const MyScaffoldTemplate(
        //   centerTitle: false,
        //   title: "Flutter A2",
        //   body: MyHomePage(title: 'Flutter Demo Home Page'),
        // ),
      ),
    );
  }
}
