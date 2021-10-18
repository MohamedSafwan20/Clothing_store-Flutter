import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gentleman/services/db_service.dart';
import 'package:gentleman/widgets/error.dart';
import 'package:gentleman/widgets/loading.dart';
import 'package:gentleman/widgets/navbar.dart';
import 'package:gentleman/widgets/product_result_card.dart';

class ProductResult extends StatefulWidget {
  const ProductResult({Key? key}) : super(key: key);

  @override
  _ProductResultState createState() => _ProductResultState();
}

class _ProductResultState extends State<ProductResult> {
  @override
  Widget build(BuildContext context) {
    Map navigatorData = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: navigatorData["page"] == "newArrivalsSection"
                ? FutureBuilder(
                    future: DbService.getLatestProducts(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const NavBar(),
                              Expanded(
                                flex: 1,
                                child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return ProductResultCard(
                                          productData:
                                              snapshot.data[index].data(),
                                          id: snapshot.data[index].id);
                                    }),
                              )
                            ],
                          );
                        } else {
                          return const Error();
                        }
                      } else {
                        return const Loading();
                      }
                    },
                  )
                : navigatorData["page"] == "lowestPriceSection"
                    ? FutureBuilder(
                        future: DbService.getLowestPriceProducts(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const NavBar(),
                                  Expanded(
                                    flex: 1,
                                    child: ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return ProductResultCard(
                                              productData:
                                                  snapshot.data[index].data(),
                                              id: snapshot.data[index].id);
                                        }),
                                  )
                                ],
                              );
                            } else {
                              return const Error();
                            }
                          } else {
                            return const Loading();
                          }
                        },
                      )
                    : navigatorData["page"] == "Shirts"
                        ? FutureBuilder(
                            future: DbService.getProductsByCategory(
                                navigatorData["category"]),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const NavBar(),
                                      Expanded(
                                        flex: 1,
                                        child: ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index) {
                                              return ProductResultCard(
                                                  productData: snapshot
                                                      .data[index]
                                                      .data(),
                                                  id: snapshot.data[index].id);
                                            }),
                                      )
                                    ],
                                  );
                                } else {
                                  return const Error();
                                }
                              } else {
                                return const Loading();
                              }
                            },
                          )
                        : navigatorData["page"] == "Tshirts"
                            ? FutureBuilder(
                                future: DbService.getProductsByCategory(
                                    navigatorData["category"]),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const NavBar(),
                                          Expanded(
                                            flex: 1,
                                            child: ListView.builder(
                                                itemCount: snapshot.data.length,
                                                itemBuilder: (context, index) {
                                                  return ProductResultCard(
                                                      productData: snapshot
                                                          .data[index]
                                                          .data(),
                                                      id: snapshot
                                                          .data[index].id);
                                                }),
                                          )
                                        ],
                                      );
                                    } else {
                                      return const Error();
                                    }
                                  } else {
                                    return const Loading();
                                  }
                                },
                              )
                            : navigatorData["page"] == "Pants"
                                ? FutureBuilder(
                                    future: DbService.getProductsByCategory(
                                        navigatorData["category"]),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasData) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const NavBar(),
                                              Expanded(
                                                flex: 1,
                                                child: ListView.builder(
                                                    itemCount:
                                                        snapshot.data.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ProductResultCard(
                                                          productData: snapshot
                                                              .data[index]
                                                              .data(),
                                                          id: snapshot
                                                              .data[index].id);
                                                    }),
                                              )
                                            ],
                                          );
                                        } else {
                                          return const Error();
                                        }
                                      } else {
                                        return const Loading();
                                      }
                                    },
                                  )
                                : navigatorData["page"] == "Shorts"
                                    ? FutureBuilder(
                                        future: DbService.getProductsByCategory(
                                            navigatorData["category"]),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            if (snapshot.hasData) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const NavBar(),
                                                  Expanded(
                                                    flex: 1,
                                                    child: ListView.builder(
                                                        itemCount: snapshot
                                                            .data.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ProductResultCard(
                                                              productData:
                                                                  snapshot.data[
                                                                          index]
                                                                      .data(),
                                                              id: snapshot
                                                                  .data[index]
                                                                  .id);
                                                        }),
                                                  )
                                                ],
                                              );
                                            } else {
                                              return const Error();
                                            }
                                          } else {
                                            return const Loading();
                                          }
                                        },
                                      )
                                    : FutureBuilder(
                                        future: DbService.getProductResults(
                                            navigatorData["product_name"]),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            if (snapshot.hasData) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const NavBar(),
                                                  snapshot.data.length > 0
                                                      ? Expanded(
                                                          flex: 1,
                                                          child:
                                                              ListView.builder(
                                                                  itemCount:
                                                                      snapshot
                                                                          .data
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return ProductResultCard(
                                                                        productData: snapshot
                                                                            .data[
                                                                                index]
                                                                            .data(),
                                                                        id: snapshot
                                                                            .data[index]
                                                                            .id);
                                                                  }),
                                                        )
                                                      : SizedBox(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height -
                                                              150,
                                                          child: Center(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.network(
                                                                  "https://img.icons8.com/color/48/000000/nothing-found.png",
                                                                  width: 80,
                                                                ),
                                                                Text(
                                                                  "Results Not Found!",
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .disabledColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                ],
                                              );
                                            } else {
                                              return const Error();
                                            }
                                          } else {
                                            return const Loading();
                                          }
                                        },
                                      )),
      ),
    );
  }
}
