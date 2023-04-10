import 'package:permission_handler/permission_handler.dart';

Future<bool> handlePermission(Permission permission) async {
  // if (await Permission.storage.isGranted) {
  //   return true;
  // } else {}

  while (!await permission.isGranted) {
    await permission.request();
  }
  return true;
}
