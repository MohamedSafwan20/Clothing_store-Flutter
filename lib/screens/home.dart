import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/services/user_service.dart';
import 'package:gentleman/widgets/category_section.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/lowest_price_section.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/new_arrivals_section.dart';
import 'package:gentleman/widgets/regular_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String _selectedCategory = "All";

  @override
  void initState() {
    UserService.isUserAuthenticated().then((value) {
      if (value == null) {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });

    super.initState();
  }

  List<String> chipsItems = ["All", "Shirts", "Tshirts", "Pants", "Shorts"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavBar(),
              Padding(
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
                                _selectedCategory = chipsItems[index];
                              });
                            },
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                            selected: _selectedIndex == index,
                            labelStyle: TextStyle(
                                color: _selectedIndex == index
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.primary),
                          ),
                        );
                      }),
                ),
              ),
              _selectedCategory == "All"
                  ? FutureBuilder(
                      future: Future.wait([
                        DbService.getLatestProducts(),
                        DbService.getLowestPriceProducts()
                      ]),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            return Column(
                              children: [
                                NewArrivalsSection(
                                  productData: snapshot.data[0],
                                ),
                                LowestPriceSection(
                                  productData: snapshot.data[1],
                                )
                              ],
                            );
                          } else {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height - 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: RegularButton(
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        text: "Refresh"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      "Error occurred, Please refresh the page.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              )),
                            );
                          }
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 150,
                            child: const Center(child: Loading()),
                          );
                        }
                      },
                    )
                  : _selectedCategory == "Shirts"
                      ? CategorySection(category: _selectedCategory)
                      : _selectedCategory == "Tshirts"
                          ? CategorySection(category: _selectedCategory)
                          : _selectedCategory == "Pants"
                              ? CategorySection(category: _selectedCategory)
                              : _selectedCategory == "Shorts"
                                  ? CategorySection(category: _selectedCategory)
                                  : Container()
            ],
          ),
        ),
      )),
    );
  }
}
