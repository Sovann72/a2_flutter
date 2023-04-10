import 'dart:io';

import 'package:path_provider/path_provider.dart';

// class FileService {
//   static FileService? _instance;

//   FileService._internal() {
//     _instance = this;
//   }

//   factory FileService() => _instance ?? FileService._internal();

//   static Future<String> directoryPath() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

//   static Future<File> file(String fileName) async {
//     final path = await directoryPath();
//     return File("$path/$fileName");
//   }

//   //read as string
//   static Future<String> readFile(String fileName) async {
//     String fileContent = "";
//     File tempFile = await file(fileName);
//     if (await tempFile.exists()) {
//       // try {
//       fileContent = await tempFile.readAsString();
//       // }catch(e) {
//       // };
//     } else {
//       print('\x1B[31mno content is in this file');
//     }

//     return fileContent;
//   }

//   //write as string
//   static Future writeFile(String fileName, {required String content}) async {
//     try {
//       File tempFile = await file(fileName);
//       await tempFile.writeAsString(content);
//       final path = await directoryPath();
//       print('\x1B[32msuccessfully write to file: $path/$fileName');
//     } catch (e) {
//       print('\x1B[31m error: $e');
//     }
//   }
// }

enum DirType { document, support, external }

class FileService {
  static FileService? _instance;

  FileService._internal() {
    _instance = this;
  }

  factory FileService() => _instance ?? FileService._internal();

  static Future<String> directoryPath(
      {DirType dirtype = DirType.document}) async {
    late Directory? directory;
    if (dirtype == DirType.document) {
      directory = await getApplicationDocumentsDirectory();
    } else if (dirtype == DirType.support) {
      directory = await getApplicationSupportDirectory();
    } else if (dirtype == DirType.external) {
      directory = await getExternalStorageDirectory();
    }
    return directory!.path;
  }

  static Future<File> file(String fileName) async {
    final path = await directoryPath();
    return File("$path/$fileName");
  }

  //read as string
  static Future<String> readFile(String fileName) async {
    String fileContent = "";
    File tempFile = await file(fileName);
    final path = await directoryPath();
    if (await tempFile.exists()) {
      fileContent = await tempFile.readAsString();
      print('\x1B[32mread from: $path/$fileName');
    } else {
      print('\x1B[31mno content is in this file');
    }

    if (fileContent == "") {
      print('\x1B[31mthis file has no content');
    }
    return fileContent;
  }

  //write as string
  static Future writeFile(String fileName, {required String content}) async {
    try {
      File tempFile = await file(fileName);
      await tempFile.writeAsString(content);
      final path = await directoryPath();
      print('\x1B[32mwritten to: $path/$fileName');
    } catch (e) {
      print('\x1B[31m error: $e');
    }
  }

  static Future clear(String fileName) async {
    try {
      await writeFile(fileName, content: "");
      print('\x1B[32m succesfully clear');
    } catch (e) {
      print('\x1B[31m error: $e');
    }
  }
}
