import 'package:a2_tutorial/src/provider/search_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBarDelegate extends SearchDelegate {
  MySearchBarDelegate();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query == "") {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchHistory = Provider.of<SearchFileProvider>(context);
    final searchHistoryUpdate =
        Provider.of<SearchFileProvider>(context, listen: false);
    searchHistory.addSeachHistory(query.toString());
    return Center(
      child: Text(
        query,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue[300],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionKeyword = [
      "fish",
      "mango",
      "qiyana",
      "ben10 and alien",
      "cs degree",
      "flutter"
    ];
    final searchHistory = Provider.of<SearchFileProvider>(context);
    final searchHistoryUpdate =
        Provider.of<SearchFileProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: searchHistory.searchHistory.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = searchHistoryUpdate.searchHistory[index];
            showResults(context);
          },
          leading: Text(searchHistory.searchHistory[index]),
        ),
        // itemCount: suggestionKeyword.length,
      ),
    );
  }
}
