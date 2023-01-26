import 'package:a2_tutorial/src/app.dart';
import 'package:a2_tutorial/src/utilities/hive/type/bank_account.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
Future<void> main() async {
  Hive.registerAdapter<BankAccount>(BankAccountAdapter());
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  // box.put("bankAccount", BankAccount(currency: "riel", myMoney: 100));
  runApp(const MyApp());
}
