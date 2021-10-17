import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/error.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/search_item_list.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  final StreamController _keywordStream = StreamController();

  void filterSearch(String value, List data) {
    if (value.isNotEmpty) {
      value = value.toLowerCase();
      List filteredKeywords = data.map((item) {
        if (item.data()["product_name"].toLowerCase().contains(value)) {
          return item.data()["product_name"];
        } else {
          return "";
        }
      }).toList();
      filteredKeywords.removeWhere((item) => item == "");
      _keywordStream.sink.add(filteredKeywords);
    } else {
      _keywordStream.sink.add(data.map((item) {
        return item.data()["product_name"];
      }).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: FutureBuilder(
                future: DbService.getSearchKeywords(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List initialData = snapshot.data.map((item) {
                        return item.data()["product_name"];
                      }).toList();

                      return Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                              Icons.arrow_back_outlined)),
                                      SizedBox(
                                        width: 250,
                                        child: TextField(
                                          controller: _searchController,
                                          onChanged: (value) {
                                            filterSearch(value, snapshot.data);
                                          },
                                          autofocus: true,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Search.."),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _searchController.text = "";
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 20,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          StreamBuilder(
                              stream: _keywordStream.stream,
                              initialData: initialData,
                              builder: (context, AsyncSnapshot streamSnapshot) {
                                if (streamSnapshot.hasData) {
                                  return Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      // child: Text("hi")
                                      child: SearchItemList(
                                          keywords: streamSnapshot.data,
                                          searchController: _searchController),
                                    ),
                                  );
                                } else {
                                  return const Loading();
                                }
                              })
                        ],
                      );
                    } else {
                      return const Error();
                    }
                  } else {
                    return const Loading();
                  }
                },
              ))),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _keywordStream.close();
    super.dispose();
  }
}
