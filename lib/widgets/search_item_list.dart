import 'package:flutter/material.dart';

class SearchItemList extends StatefulWidget {
  const SearchItemList(
      {Key? key, required this.keywords, required this.searchController})
      : super(key: key);

  final List keywords;
  final TextEditingController searchController;

  @override
  _SearchItemListState createState() => _SearchItemListState();
}

class _SearchItemListState extends State<SearchItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.keywords.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/product-result",
                        arguments: {"product_name": widget.keywords[index]});
                  },
                  title: Text(widget.keywords[index]),
                ),
              ),
              Expanded(
                flex: 0,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.searchController.text = widget.keywords[index];
                      });
                    },
                    icon: const Icon(Icons.north_west_outlined)),
              )
            ],
          );
        });
  }
}
