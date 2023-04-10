import 'dart:io';

import 'package:a2_tutorial/src/pages/sura_test/new_tests/download_pdf.dart';
import 'package:a2_tutorial/src/services/file_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sura_manager/sura_manager.dart';

class StoreAndLoadImg extends StatefulWidget {
  const StoreAndLoadImg({super.key});

  @override
  State<StoreAndLoadImg> createState() => _StoreAndLoadImgState();
}

class _StoreAndLoadImgState extends State<StoreAndLoadImg> {
  @override
  void initState() {
    progress = 0.0;
    super.initState();
  }

  Dio dio = Dio();
  late double progress;
  FutureManager loadImgStorage = FutureManager();

  late File fileLoadFromLocalStorage;

  Future<void> loadImageFromStorage() async {
    final dir = await FileService.directoryPath(dirtype: DirType.external);
    loadImgStorage.asyncOperation(() async {
      fileLoadFromLocalStorage =
          await File(dir + "/" + getPhotoLocalFileName(antiMageManaBreak));
      return true;
    });
  }

  String antiMageManaBreak =
      "https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/abilities/antimage_mana_break.png";

  String getPhotoLocalFileName(String url) {
    late int startIndx;
    for (int i = url.length - 1; i > 0; i--) {
      if (url[i] == "/") {
        startIndx = i;
        break;
      }
    }
    return url.substring(startIndx + 1, url.length);
  }

  void handleDownloadPress() async {
    await downloadImg();
  }

  Future<void> downloadImg() async {
    if (await requestPermission(Permission.storage)) {
      final dir = await FileService.directoryPath(dirtype: DirType.external);

      await dio.download(antiMageManaBreak,
          dir + "/" + getPhotoLocalFileName(antiMageManaBreak),
          onReceiveProgress: (count, total) {
        progress = count / total;
        setState(() {});
        Future.delayed(Duration(seconds: 2)).then((value) {
          progress = 0.0;
          setState(() {});
        });
      });
    }
  }

  void openFile() async {
    final dir = await FileService.directoryPath(dirtype: DirType.external);
    OpenFilex.open(dir + "/" + getPhotoLocalFileName(antiMageManaBreak));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("store and load")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: handleDownloadPress, icon: Icon(Icons.download)),
              IconButton(
                  onPressed: loadImageFromStorage,
                  icon: Icon(Icons.arrow_upward)),
              IconButton(
                onPressed: openFile,
                icon: Icon(Icons.open_in_browser),
              ),
              Row(
                children: [Text((progress * 100).toStringAsFixed(0))],
              ),
              LinearProgressIndicator(
                value: progress,
                color: Colors.blue[300],
                backgroundColor: Colors.white,
              ),
              FutureManagerBuilder(
                  futureManager: loadImgStorage,
                  loading: Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text("loading"),
                    ),
                  ),
                  ready: (context, data) {
                    return Image.file(fileLoadFromLocalStorage);
                  })
            ]),
      ),
    );
  }
}
