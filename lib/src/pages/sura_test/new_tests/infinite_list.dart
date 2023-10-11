import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  final dio = Dio(BaseOptions(baseUrl: "https://api.staging.tenbox.co"));

  List<String> list = [];
  final scrollController = ScrollController();
  bool isLastPage = false;
  final count = 15;
  bool isLoadMoreData = false;
  int pageKey = 1;

  final listViewKey = GlobalKey();
  void fetchData(int pageKey) async {
    await dio.get("/product/all",
        queryParameters: {"page": pageKey, "limit": count}).then((value) {
      debugPrint("products.length: ${(value.data["data"] as List).length}");
      (value.data["data"] as List).forEach((product) {
        if ((value.data["data"] as List).length < count) {
          setState(() {
            isLastPage = true;
          });
        }
        list.add(product["product"]["id"]);

        pageKey += 1;
        setState(() {});
        // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(listenToScroll);
    fetchData(pageKey);
  }

  void listenToScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      debugPrint("hello boss, isLoadMoreData: ${isLoadMoreData}}");
      if (!isLoadMoreData) {
        setState(() {
          isLoadMoreData = true;
        });
        fetchData(pageKey);
        setState(() {
          isLoadMoreData = false;
        });
      } else {
        debugPrint("loading data");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget loading = Center(
      child: CircularProgressIndicator(),
    );

    Widget listView = SingleChildScrollView(
      key: listViewKey,
      controller: scrollController,
      child: Column(children: [
        ...List.generate(
            list.length,
            (index) => Card(
                  child: ListTile(title: Text(index.toString())),
                )),
        if (isLoadMoreData) CircularProgressIndicator(),
      ]),
    );

    Widget mainUI() {
      if (list.isEmpty) {
        return loading;
      } else {
        return listView;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("infinite list")),
      body: mainUI(),
    );
  }
}
