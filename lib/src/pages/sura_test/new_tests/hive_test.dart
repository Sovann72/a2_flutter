import 'package:a2_tutorial/main.dart';
import 'package:a2_tutorial/src/utilities/hive/type/bank_account.dart';
import 'package:a2_tutorial/widget/scaffold_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHiveTest extends StatefulWidget {
  const MyHiveTest({super.key});

  @override
  State<MyHiveTest> createState() => _MyHiveTestState();
}

class _MyHiveTestState extends State<MyHiveTest> {
  String? currency;
  String? money;

  @override
  void initState() {
    currency = "";
    money = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffoldTemplate(
        title: "Hive",
        body: Column(
          children: [
            // TextButton(
            //     onPressed: () {
            //       box.put("bankAccount",
            //           BankAccount(currency: "dollar", myMoney: 10));
            //     },
            //     child: Text("dollar, 10")),
            // TextButton(
            //     onPressed: () {
            //       box.put("bankAccount",
            //           BankAccount(currency: "riel", myMoney: 40000));
            //     },
            //     child: Text("riel, 40000")),
            // TextButton(
            //     onPressed: () {
            //       box.put("bankAccount",
            //           BankAccount(currency: "yen", myMoney: 1300));
            //     },
            //     child: Text("yen, 1300")),
            // SizedBox(height: 50),
            // TextButton(
            //     onPressed: () {
            //       BankAccount getBankAccount = box.get("bankAccount");
            //       currency = getBankAccount.currency;
            //       money = getBankAccount.myMoney.toString();
            //       setState(() {});
            //     },
            //     child: Text("get money in the bank")),
            // Text(currency ?? ""),
            // Text(money ?? ""),
          ],
        )
        // body: Center(
        //     child: Column(
        //   children: [
        //     Text(bankAccount.currency),
        //     Text(bankAccount.myMoney.toString())
        //   ],
        // )),
        );
  }
}
