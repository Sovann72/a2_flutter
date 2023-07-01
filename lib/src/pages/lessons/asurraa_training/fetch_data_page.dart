import 'package:a2_tutorial/src/pages/list/todo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sura_manager/sura_manager.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({super.key});

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  FutureManager loadingPage = FutureManager();
  late TodoModel todo;

  void fetchData() {
    loadingPage.asyncOperation(() async {
      todo = await Dio()
          .fetch(RequestOptions(
        baseUrl: "https://jsonplaceholder.typicode.com",
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        path: "/todos/1",
        headers: <String, dynamic>{"hello": 6},
        // data: {},
        method: "get",
        queryParameters: <String, dynamic>{
          "sovann": "en",
          "rith": "chhorn",
          "change": "bean"
        },
        // responseType: ResponseType.json,
      ))
          .then((response) async {
        print(response);
        return TodoModel.fromMap(response.data as Map<String, dynamic>);
      });

      return true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fetch data"),
      ),
      body: FutureManagerBuilder(
          futureManager: loadingPage,
          ready: (context, data) {
            return Center(
              child: Text(todo.title),
            );
          }),
    );
  }
}
