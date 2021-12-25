import 'dart:ffi';
import 'dart:math';

import 'package:ecommerce/models/fetchAsosProducts.dart';
import 'package:flutter/material.dart';
import 'selectedItem.dart';
import 'main.dart';

List<String> _personList = [];
List<String> _searchList = [];

class SearchItemsView extends StatefulWidget {
  SearchItemsView({Key? key, this.searchText}) : super(key: key);
  var searchText;

  @override
  State<SearchItemsView> createState() => _SearchItemsView();
}

class _SearchItemsView extends State<SearchItemsView> {
  var resultFoundCount = 0;
  var resultFoundImage;
  var defaultViewLayout = true; // true == gridview, false == listview
  late Future<Products> futurePoducts;

  @override
  void initState() {
    super.initState();
    futurePoducts = fetchProducts(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Search Products",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 45,
              child: new TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(10.0),
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 15.0, color: Colors.grey),
                    ),
                    hintText: "Search Products"),
                onChanged: (text) {
                  if (text.isEmpty || text == null) {
                    setState(() {
                      resultFoundCount = 0;
                      resultFoundImage = "";
                    });
                  } else {
                    setState(() {
                      resultFoundCount = viewListIconUrls
                          .where(
                              (element) => element.toLowerCase().contains(text))
                          .length;
                      resultFoundImage = viewListIconUrls
                          .where(
                              (element) => element.toLowerCase().contains(text))
                          .first;
                    });
                  }
                },
                onSubmitted: (text) {
                  if (text.isEmpty) {
                    setState(() {
                      resultFoundCount = 0;
                      resultFoundImage = "";
                    });
                  } else {
                    setState(() {
                      fetchProducts(new Random().nextInt(10));
                      resultFoundCount = viewListIconUrls
                          .where(
                              (element) => element.toLowerCase().contains(text))
                          .length;
                      resultFoundImage = viewListIconUrls
                          .where(
                              (element) => element.toLowerCase().contains(text))
                          .first;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.view_list),
                        onPressed: () => setState(() {
                          defaultViewLayout = false;
                        }),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.grid_view),
                        onPressed: () => setState(() {
                          defaultViewLayout = true;
                        }),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () => print("filter"),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      child: Text(
                        "Sort",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () => print("sort"),
                    ),
                  ],
                ),
              ],
            ),
            FutureBuilder<Products>(
              future: futurePoducts,
              builder: (context, data) {
                if (data.hasData) {
                  return Expanded(
                    child: defaultViewLayout
                        ? GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: (110 / 150),
                            children: new List<Widget>.generate(
                              resultFoundCount != 0 ? resultFoundCount : 0,
                              (index) {
                                return new GridTile(
                                  child: new Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 5, right: 5),
                                    color: Colors.white,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SelectedItem(
                                              imageUrl: viewListSneakersPics[0],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.network(
                                            data.data!.image,
                                            height: 150,
                                            width: 150,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  data.data!.title,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "NIKE",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$${data.data!.price}",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "ADD TO CART",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (BuildContext, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/${resultFoundImage}",
                                    width: 100,
                                    height: 100,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.21,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "FRANCE AUTHENTIC HOME JERSEY 2018",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          "Nike",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          r"$130",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "ADD TO CART",
                                          style: TextStyle(color: Colors.blue),
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount:
                                resultFoundCount != 0 ? resultFoundCount : 0,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(5),
                            scrollDirection: Axis.vertical,
                          ),
                  );
                } else if (data.hasError) {
                  return Text('${data.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
