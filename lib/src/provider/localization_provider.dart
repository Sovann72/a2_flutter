import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Map<String, dynamic> enUs = {};
  Map<String, dynamic> kmKh = {};

  void setEnUsLocale(Map<String, dynamic> lang) {
    enUs = lang;
    notifyListeners();
  }

  void setKmKhLocale(Map<String, dynamic> lang) {
    kmKh = lang;
    notifyListeners();
  }
}
