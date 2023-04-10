import 'package:a2_tutorial/src/pages/sura_test/new_tests/search_bar/search_bar_delegate.dart';
import 'package:a2_tutorial/src/provider/search_file_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Bar"),
        actions: [
          GestureDetector(
            onTap: () async {
              final searchProvider =
                  Provider.of<SearchFileProvider>(context, listen: false);
              await searchProvider.read();
              if (kDebugMode)
                print("\x1B[32mlength: ${searchProvider.searchHistory.length}");
              print('\x1B[32msearch provider called succesfully');

              showSearch(context: context, delegate: MySearchBarDelegate());
            },
            child: Icon(
              Icons.search,
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Center(
        child: Text("This is Search Bar"),
      ),
    );
  }
}
