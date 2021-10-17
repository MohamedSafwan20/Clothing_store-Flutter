import 'package:flutter/material.dart';

class SearchItemList extends StatefulWidget {
  const SearchItemList({Key? key, required this.keywords}) : super(key: key);

  final List keywords;

  @override
  _SearchItemListState createState() => _SearchItemListState();
}

class _SearchItemListState extends State<SearchItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  onTap: () {},
                  title: Text(widget.keywords[index]["product_name"]),
                ),
              ),
              Expanded(
                flex: 0,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.north_west_outlined)),
              )
            ],
          );
        });
  }
}
