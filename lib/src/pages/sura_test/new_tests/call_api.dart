import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:soriya_flutter/soriya_flutter.dart';
import 'package:sura_manager/sura_manager.dart';

class CallingAPIPage extends StatefulWidget {
  const CallingAPIPage({super.key});

  @override
  State<CallingAPIPage> createState() => _CallingAPIPageState();
}

class _CallingAPIPageState extends State<CallingAPIPage> {
  FutureManager<List<Map<String, dynamic>>> loadingPage = FutureManager();
  // FutureManager secondMananger = FutureManager();
  Dio dio = Dio();
  List<Map<String, dynamic>> list = [];
  Map<String, dynamic> product = {};

  void fetchData() async {
    await loadingPage.asyncOperation(() async {
      return dio
          .request("https://jsonplaceholder.typicode.com/todos",
              options: Options(
                method: "get",
              ))
          .then((value) {
        return value.data as List<Map<String, dynamic>>;
      });

      //     .then((value) {
      //   if (value.data is List) {
      //     list = (value.data as List)
      //         .map((e) => e as Map<String, dynamic>)
      //         .toList();
      //   }
      // });

      // return true;
    });

    // secondMananger.asyncOperation(() async {
    //   await dio
    //       .request("https://dummyjson.com/products/1",
    //           options: Options(method: "get"))
    //       .then((value) {
    //     product = value.data as Map<String, dynamic>;
    //   });
    //   return true;
    // });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            decoration: decoration.borderamber,
            height: 300,
            child: FutureManagerBuilder(
              futureManager: loadingPage,
              ready: (context, data) {
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          "${list[index]["title"]}",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            decoration: decoration.borderblue,
            height: 200,
            // child: FutureManagerBuilder(
            //   futureManager: secondMananger,
            //   ready: (context, data) {
            //     return Column(
            //       children: [
            //         Text("${product["title"]}"),
            //         Text("${product["price"]}"),
            //         Text("${product["description"]}"),
            //       ],
            //     );
            //   },
            // ),
          )
        ],
      ),
    );
  }
}
