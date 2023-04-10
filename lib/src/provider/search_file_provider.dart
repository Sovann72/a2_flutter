import 'dart:convert';

import 'package:a2_tutorial/src/services/file_service.dart';
import 'package:flutter/cupertino.dart';

class SearchFileProvider extends ChangeNotifier {
  static const String _SEARCH_FILE_NAME = "search.json";
  late String data = "";
  late List<String> searchHistory;

  void addSeachHistory(String item) {
    searchHistory.add(item);
    notifyListeners();
  }

  void deleteSearchHistory(String item) {
    searchHistory.removeWhere((element) => element == item);
    notifyListeners();
  }

  @override
  void dispose() {
    write(searchHistory);
    super.dispose();
  }

  SearchFileProvider() {
    read();
  }

  Future<List<String>> read() async {
    data = await FileService.readFile(_SEARCH_FILE_NAME);
    if (data == "") {
      return [];
    }
    final res = jsonDecode(data)["data"];
    searchHistory = res;
    return res;
  }

  List<String> readContent() {
    return jsonDecode(data);
  }

  Future<void> clear() async {
    await FileService.clear(_SEARCH_FILE_NAME);
  }

  Future<void> write<T>(T data) async {
    await FileService.writeFile(_SEARCH_FILE_NAME,
        content: jsonEncode({"data": data}));
    notifyListeners();
  }
}
