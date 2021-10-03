import 'package:flutter/material.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({Key? key}) : super(key: key);

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int _selectedIndex = 0;

  List<String> chipsItems = ["All", "Shirts", "Tshirts", "Pants", "Shorts"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chipsItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: ChoiceChip(
                  padding: const EdgeInsets.all(8.0),
                  pressElevation: 0,
                  label: Text(chipsItems[index]),
                  onSelected: (_) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  selectedColor: Theme.of(context).colorScheme.primary,
                  selected: _selectedIndex == index,
                  labelStyle: TextStyle(
                      color: _selectedIndex == index
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary),
                ),
              );
            }),
      ),
    );
  }
}
