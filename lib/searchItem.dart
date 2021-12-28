import 'package:ecommerce/models/fetchAsosProducts.dart';
import 'package:flutter/material.dart';
import 'selectedItem.dart';
import 'main.dart';

class SearchItemsView extends StatefulWidget {
  SearchItemsView({Key? key, this.searchText}) : super(key: key);
  var searchText;

  @override
  State<SearchItemsView> createState() => _SearchItemsView();
}

class _SearchItemsView extends State<SearchItemsView> {
  List<Product> visibleNames = [];
  var defaultViewLayout = true; // true == gridview, false == listview
  late final Future<List<Product>> futurePoducts;

  @override
  void initState() {
    super.initState();
    futurePoducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldColor,
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
                  if (text.isEmpty) {
                    setState(() {
                      visibleNames = [];
                    });
                  } else {
                    setState(
                      () {
                        visibleNames = [];
                        futurePoducts.then(
                          (value) => {
                            value.forEach((element) {
                              if (element.title
                                  .toLowerCase()
                                  .contains(text.toLowerCase())) {
                                visibleNames.add(element);
                              }
                            }),
                          },
                        );
                      },
                    );
                  }
                },
                onSubmitted: (text) {
                  if (text.isEmpty) {
                    setState(() {
                      visibleNames = [];
                    });
                  } else {
                    setState(
                      () {
                        visibleNames = [];

                        futurePoducts.then(
                          (value) => {
                            value.forEach((element) {
                              if (element.title
                                  .toLowerCase()
                                  .contains(text.toLowerCase())) {
                                visibleNames.add(element);
                              }
                            })
                          },
                        );
                      },
                    );
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
            FutureBuilder<List<Product>>(
              future: futurePoducts,
              builder: (context, Null) {
                if (visibleNames.isNotEmpty) {
                  return Expanded(
                    child: defaultViewLayout
                        ? GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: (100 / 150),
                            children: new List<Widget>.generate(
                              visibleNames.length != 0
                                  ? visibleNames.length
                                  : 0,
                              (index) {
                                return new GridTile(
                                  child: new Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      left: 5,
                                    ),
                                    color: Colors.white,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SelectedItem(
                                              product: visibleNames[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.network(
                                            visibleNames[index].image,
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
                                                  visibleNames[index].title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                    "Rating: ${visibleNames[index].rating}",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$${visibleNames[index].price.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      child: Text(
                                                        "ADD TO CART",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.blue),
                                                      ),
                                                      onPressed: () {
                                                        print('Pressed');
                                                      },
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
                                  Image.network(
                                    visibleNames[index].image,
                                    width: 100,
                                    height: 100,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.2,
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          visibleNames[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          visibleNames[index].rating.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$${visibleNames[index].price.toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () => print("pressed"),
                                          child: Text(
                                            "ADD TO CART",
                                            style:
                                                TextStyle(color: Colors.blue),
                                            overflow: TextOverflow.fade,
                                            maxLines: 2,
                                            softWrap: true,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: visibleNames.length != 0
                                ? visibleNames.length
                                : 0,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(5),
                            scrollDirection: Axis.vertical,
                          ),
                  );
                } else if (visibleNames.isEmpty) {
                  return Text("");
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
