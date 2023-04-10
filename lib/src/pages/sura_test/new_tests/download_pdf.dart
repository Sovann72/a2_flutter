import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:open_filex/open_filex.dart';

class DownloadPDFPage extends StatefulWidget {
  const DownloadPDFPage({super.key});

  @override
  State<DownloadPDFPage> createState() => _DownloadPDFPageState();
}

class _DownloadPDFPageState extends State<DownloadPDFPage> {
  double progress = 0.0;
  final Dio dio = Dio();

  void getFile() async {
    OpenFilex.open(
        "/data/user/0/com.example.a2_tutorial/app_flutter/order.pdf");
  }

  // Future<bool> _requestPermission(Permission permission) async {
  //   if (await permission.isGranted) {
  //     return true;
  //   } else {
  //     var result = await permission.request();
  //     if (result == PermissionStatus.granted) {
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  downloadFile() async {
    bool downloaded = await saveVideo(
        "https://api.tenbox.asurraa.dev/order/pdf/2de2606e-f5f1-40c9-a629-b8a0054700ac",
        "order.pdf");
    if (downloaded) {
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
  }

  Future<bool> saveVideo(String url, String fileName) async {
    late Directory directory;
    try {
      if (await requestPermission(Permission.storage)) {
        directory = await getApplicationDocumentsDirectory();
        if (kDebugMode) print('\x1B[31mdir: ${directory.path}');
      } else {
        return false;
      }

      File saveFile = File("${directory.path}/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        });
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  void downloadWithWeb() async {
    Directory myDir = await getApplicationDocumentsDirectory();
    Uri uri = Uri(
      scheme: "https",
      host: "api.tenbox.asurraa.dev",
      path: "order/pdf/2de2606e-f5f1-40c9-a629-b8a0054700ac",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("download pdf")),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(onTap: downloadFile, child: Text("download pdf")),
            GestureDetector(
              onTap: getFile,
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 30,
                  width: 100,
                  child: Center(child: Text("get pdf"))),
            )
          ],
        ),
      ),
    );
  }
}

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
