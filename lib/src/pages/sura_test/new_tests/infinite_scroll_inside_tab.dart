import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfiniteScrollInsideTab extends StatefulWidget {
  const InfiniteScrollInsideTab({super.key});

  @override
  State<InfiniteScrollInsideTab> createState() =>
      _InfiniteScrollInsideTabState();
}

class _InfiniteScrollInsideTabState extends State<InfiniteScrollInsideTab>
    with SingleTickerProviderStateMixin {
  List<dynamic> list1 = [];
  List<dynamic> list2 = [];
  List<dynamic> list3 = [];
  late TabController tabController;
  late PagingController<int, dynamic> pagingController1;
  late PagingController<int, dynamic> pagingController2;
  late PagingController<int, dynamic> pagingController3;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    pagingController1 = PagingController<int, dynamic>(firstPageKey: 1);
    pagingController2 = PagingController<int, dynamic>(firstPageKey: 2);
    pagingController3 = PagingController<int, dynamic>(firstPageKey: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("infinite scroll inside tab"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(controller: tabController, tabs: [
              Text("hello"),
              Text("nah"),
              Text("man"),
            ]),
          )),
      body: TabBarView(controller: tabController, children: [
        RefreshIndicator(
          onRefresh: () async => Future.sync(() => pagingController1.refresh()),
          child: InfiniteListScroll.box(
            numberOfPage: 5,
            pageSize: 1,
            pagingController: pagingController1,
            builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => ListTile(
                      title: ListTile(title: Text(item["id"].toString())),
                    )),
            onFetch: (pageKey, pageSize) async {
              final myDio = Dio();
              Future<List<dynamic>> item = myDio
                  .getUri(Uri.parse(
                      "https://dummyjson.com/products?limit=${pageSize}&skip=${pageKey}"))
                  .then((value) => (value.data["products"]) as List<dynamic>);
              // list1 = [
              //   ...list1,
              //   ...await item,
              // ];
              // myDio.close();
              return item;
            },
          ),
        ),
        Container(),
        Container(),
        // RefreshIndicator(
        //   onRefresh: () async => pagingController2.refresh(),
        //   child: InfiniteListScroll.box(
        //     numberOfPage: 5,
        //     pageSize: 1,
        //     pagingController: pagingController2,
        //     builderDelegate: PagedChildBuilderDelegate(
        //         itemBuilder: (context, item, index) => ListTile(
        //               title: ListTile(title: Text(item["id"].toString())),
        //             )),
        //     onFetch: (pageKey, pageSize) async {
        //       final myDio = Dio();
        //       Future<List<dynamic>> item = myDio
        //           .getUri(Uri.parse(
        //               "https://dummyjson.com/products?limit=${pageSize}&skip=${pageKey}"))
        //           .then((value) => (value.data["products"]) as List<dynamic>);
        //       list2 = [
        //         ...list2,
        //         ...await item,
        //       ];
        //       // myDio.close();
        //       return item;
        //     },
        //   ),
        // ),
        // RefreshIndicator(
        //   onRefresh: () async => pagingController3.refresh(),
        //   child: InfiniteListScroll.box(
        //     numberOfPage: 1,
        //     pageSize: 1,
        //     pagingController: pagingController3,
        //     builderDelegate: PagedChildBuilderDelegate(
        //         itemBuilder: (context, item, index) => ListTile(
        //               title: ListTile(title: Text(item["id"].toString())),
        //             )),
        //     onFetch: (pageKey, pageSize) async {
        //       final myDio = Dio();
        //       Future<List<dynamic>> item = myDio
        //           .getUri(Uri.parse(
        //               "https://dummyjson.com/products?limit=${pageSize}&skip=${pageKey}"))
        //           .then((value) => (value.data["products"]) as List<dynamic>);
        //       list3 = [
        //         ...list3,
        //         ...await item,
        //       ];
        //       // myDio.close();
        //       return item;
        //     },
        //   ),
        // ),
      ]),
    );
  }
}

enum InfiniteScrollType { sliver, box }

class InfiniteListScroll extends StatefulWidget {
  // const InfiniteScroll(
  //     {Key? key,
  //     required this.type,
  //     required this.onFetch,
  //     this.pageSize = 10,
  //     this.numberOfPage,
  //     this.scrollDirection,
  //     this.scrollController,
  //     this.pagingController,
  //     required this.builderDelegate})
  //     : super(key: key);
  const InfiniteListScroll.box({
    Key? key,
    required this.pagingController,
    required this.builderDelegate,
    required this.onFetch,
    this.pageSize = 10,
    this.numberOfPage,
    this.scrollDirection,
    this.scrollController,
  })  : type = InfiniteScrollType.box,
        super(key: key);

  const InfiniteListScroll.sliver(
      {Key? key,
      required this.onFetch,
      this.pageSize = 10,
      this.numberOfPage,
      this.scrollController,
      required this.pagingController,
      required this.builderDelegate})
      : type = InfiniteScrollType.sliver,
        scrollDirection = null,
        super(key: key);

  /// final Widget child;
  final ScrollController? scrollController;
  final PagingController<int, dynamic> pagingController;
  final PagedChildBuilderDelegate builderDelegate;

  /// can't be use with sliver render protocol
  final Axis? scrollDirection;
  final InfiniteScrollType type;
  final int? numberOfPage;
  final int pageSize;

  /// (pageKey, pageSize)
  final Future<List> Function(int pageKey, int pageSize) onFetch;

  @override
  State<InfiniteListScroll> createState() => _InfiniteListScrollState();
}

class _InfiniteListScrollState extends State<InfiniteListScroll> {
  int get pageSize => widget.pageSize;
  int? get numberOfPage => widget.numberOfPage;

  late int _pageSize;

  // FutureManager loadingPage = FutureManager();
  PagingController<int, dynamic> get _pagingController =>
      widget.pagingController;

  Future<void> _fetchPage(int pageKey) async {
    // debugPrint("PAGEKEYS: ${pageKey}");
    // try {
    //   await loadingPage.asyncOperation(() async {
    final newItems = await widget.onFetch(pageKey, _pageSize);

    late bool isLastPage;
    if (numberOfPage != null) {
      isLastPage = pageKey == numberOfPage;
    } else {
      isLastPage = newItems.length < _pageSize;
    }

    if (isLastPage) {
      _pagingController.appendLastPage(newItems);
    } else {
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(newItems, nextPageKey);
    }
    //     return true;
    //   });
    // } catch (error) {
    //   _pagingController.error = error;
    // }
  }

  @override
  void initState() {
    _pageSize = pageSize;
    _pagingController.addPageRequestListener((pageKey) async {
      await _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    /// don't dispose [_pagingController], let user dispose it by themeselve
    // _pagingController.dispose();
    // loadingPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("infinitelist get called!");
    final pageSliverList = PagedSliverList(
        key: widget.key,
        pagingController: _pagingController,
        addAutomaticKeepAlives: true,
        builderDelegate: widget.builderDelegate);

    final renderBoxList = PagedListView(
      key: widget.key,
      scrollDirection: widget.scrollDirection ?? Axis.vertical,
      pagingController: _pagingController,
      addAutomaticKeepAlives: true,
      builderDelegate: widget.builderDelegate,
    );

    return widget.type == InfiniteScrollType.sliver
        ? pageSliverList
        : renderBoxList;
  }
}
