import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'dart:math';
// Own modules
import 'models/fetchAsosProducts.dart';
import 'selectedItem.dart';
import 'shoppingCart.dart';
import 'searchItem.dart';
import 'filterItemsModel.dart';

final Color appbarColor = Color.fromRGBO(243, 243, 243, 1);
final Color ScaffoldColor = Color.fromRGBO(248, 248, 248, 1);
// final Color appbarColor = Color.fromRGBO(243, 243, 243, 1);
// final Color appbarColor = Color.fromRGBO(243, 243, 243, 1);

final List<String> viewListItemNames = ["Sneakers", "Jacket", "Watch"];
final List<String> viewListIconUrls = [
  'filterSneaker.png',
  'filterJacket.png',
  'filterWatch.png',
  'filterSneaker.png',
];
final List<String> viewListSneakersPics = [
  'sneaker1.png',
];
final List<String> viewListClothesPics = [
  'jacket.png',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;
  final _pageOptions = [
    MainPage(),
    SearchItemsView(),
    ShoppingCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          height: 20,
          width: 20,
          margin: EdgeInsets.only(left: 15, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.grey,
              size: 25,
            ),
            onPressed: () {
              print("Pressed");
            },
          ),
        ),
        title: Text(''),
        actions: [
          Container(
            height: 20,
            width: 50,
            margin: EdgeInsets.only(right: 15, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "https://source.unsplash.com/50x50/?portrait",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
        backgroundColor: ScaffoldColor,
      ),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.search),
          TabItem(icon: Icons.shopping_basket),
          TabItem(icon: Icons.favorite_border)
        ],
        initialActiveIndex: 0,
        onTap: (int index) {
          (index == 3)
              ? setState(() => selectedPage = 1)
              : setState(() => selectedPage = index);
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Our",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30)),
              Text("Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(height: 30),
              IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.3,
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
                                    borderSide: BorderSide(
                                        width: 15.0, color: Colors.grey),
                                  ),
                                  hintText: "Search Products"),
                              onSubmitted: (text) {},
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.filter_list),
                            onPressed: () {
                              print("Pressed");
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FilterItemsModel(filterByItem: index),
                                    ),
                                  ),
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: index == 0
                                          ? Colors.orange.shade600
                                          : Color.fromRGBO(255, 255, 255, 1),
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                          "assets/images/${viewListIconUrls[index]}",
                                          width: 40,
                                          height: 30),
                                      SizedBox(width: 5),
                                      Text(
                                        viewListItemNames[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "View All",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              homeScreenViewItems(products),
              SizedBox(height: 30),
              Text(
                "View All",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              homeScreenViewItems(products)
            ],
          ),
        ),
      ),
    );
  }
}

homeScreenViewItems(Future<List<Product>> products) {
  return Column(
    children: <Widget>[
      new Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 210,
              // width: 130,
              child: FutureBuilder<List<Product>>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.data!.length != 0) {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // viewListIconUrls.length
                        itemBuilder: (BuildContext ctxt, int index) {
                          bool isFavorite = Random().nextBool();
                          return GestureDetector(
                            onTap: () {
                              Future(
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectedItem(
                                          product: snapshot.data![index]),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      margin: EdgeInsets.only(right: 20),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: isFavorite
                                                          ? Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.orange,
                                                            )
                                                          : Icon(Icons
                                                              .favorite_border),
                                                    ),
                                                  ),
                                                  Image.network(
                                                    snapshot.data![index].image,
                                                    height: 120,
                                                  ),
                                                  Text(
                                                    "Nike Air Max 200",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Trending Now",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.orange),
                                                  ),
                                                  Text(
                                                    r"$240",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.data!.isEmpty) {
                    return Text("");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    ],
  );
}
