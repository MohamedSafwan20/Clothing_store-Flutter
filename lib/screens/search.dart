import 'package:flutter/material.dart';
import 'package:gentleman/widgets/search_item_list.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_outlined)),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Search.."),
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
            const Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: SearchItemList(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
