// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import 'package:a2_tutorial/src/provider/student_offline_data_provider.dart';
import 'package:a2_tutorial/src/services/file_service.dart';
import 'package:a2_tutorial/src/utilities/one_time/student_model.dart';
import 'package:a2_tutorial/src/utilities/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestFileStoragePage extends StatefulWidget {
  const TestFileStoragePage({super.key});

  @override
  State<TestFileStoragePage> createState() => _TestFileStoragePageState();
}

class _TestFileStoragePageState extends State<TestFileStoragePage> {
  late String _temp;
  double progress = 0.0;
  void readFile() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/newData.json");
    // final map = {"data": newMockData};
    // await file.writeAsString(jsonEncode(map));
    // print("sucess");

    final content = await file.readAsString();
    final students = jsonDecode(content)["data"];

    print('\x1B[31mcontent: ${students.length}');
    print('\x1B[31mcontent: ${students}');
  }

  void addOne() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/newData.json");
    final content = await file.readAsString();
    final res = jsonDecode(content)["data"];

    // print('\x1B[32m${res}');
    final students =
        res.map((e) => StudentModel.fromMap(jsonDecode(e))).toList();

    students.add(mockStudentModel);

    await file.writeAsString(jsonEncode({"data": students}));
    print('\x1B[32msuccess');
  }

  void removeOne() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/newData.json");
    final content = await file.readAsString();
    final res = jsonDecode(content)["data"];
    final List students =
        res.map((e) => StudentModel.fromMap(jsonDecode(e))).toList();

    students.removeLast();

    await file.writeAsString(jsonEncode({"data": students}));
    print('\x1B[32msuccess');
  }

  List<StudentModel> students = [];
  void callingStudentList() async {
    print('\x1B[33m invoked');
    final studentProvider =
        Provider.of<StudentOfflineDataProvider>(context, listen: false);
    students = await studentProvider.readList();
    print('\x1B[37mlength: ${students.length}');
  }

  void handleDownloadImage() async {
    print('\x1B[32m wtf');
    bool result = await handlePermission(Permission.storage);
    if (result == true) {
      final directoryPath =
          await FileService.directoryPath(dirtype: DirType.support);
      print("directory: ${directoryPath}");

      File saveFile = File(directoryPath + "/mr_robot.jpg");
      Dio dio = Dio();
      dio.download(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
          saveFile.path, onReceiveProgress: ((count, total) {
        print('\x1B[32m${count / total}');
        setState(() {
          progress = count / total;
        });
        if (count == total) {
          setState(() {
            progress = 0.0;
          });
        }
      }));
    }
  }

  @override
  void initState() {
    _temp = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("file"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: readFile,
                icon: Icon(Icons.read_more),
                label: Text("read")),
            TextButton.icon(
                onPressed: addOne,
                icon: Icon(Icons.plus_one),
                label: Text("add one")),
            TextButton.icon(
                onPressed: removeOne,
                icon: Icon(Icons.exposure_minus_1),
                label: Text("remove one")),
            TextButton.icon(
                onPressed: callingStudentList,
                icon: Icon(Icons.call_missed_outgoing),
                label: Text("calling file provider")),
            progress == 0.0
                ? TextButton.icon(
                    onPressed: handleDownloadImage,
                    icon: Icon(Icons.download),
                    label: Text("download image"))
                : LinearProgressIndicator(
                    value: progress,
                    color: Colors.blue[400],
                  ),
            ...students.map((e) => Text(e.name!)).toList()
          ],
        ),
      ),
    );
  }
}
