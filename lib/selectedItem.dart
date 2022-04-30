import 'dart:math';

import 'package:ecommerce/models/fetchAsosProducts.dart';
import 'package:ecommerce/searchItem.dart';
import 'package:ecommerce/shoppingCart.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SelectedItem extends StatefulWidget {
  SelectedItem({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  State<SelectedItem> createState() => _ItemPageState();
}

class _ItemPageState extends State<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        leading: Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15, top: 10),
            child: IconButton(
              icon: new Random().nextBool()
                  ? Icon(Icons.favorite, size: 30, color: Colors.orange)
                  : Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.black,
                    ),
              onPressed: () {
                print("Added to linked");
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              child: Container(
                color: Color.fromRGBO(243, 243, 243, 1),
                child: Column(
                  children: [
                    Image.network(
                      widget.product.image,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                          margin:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                          margin:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Image.network(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                          margin:
                              EdgeInsets.only(right: 10, top: 10, bottom: 10),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.horizontal_rule,
                              size: 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.29,
                                child: Text(
                                  widget.product.title,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        r"$",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Text(
                                        widget.product.price,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      IconTheme(
                                        data: IconThemeData(
                                          color: Colors.amber,
                                          size: 15,
                                        ),
                                        child: StarDisplay(
                                            value:
                                                widget.product.rating.toInt()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Available Sizes",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: 19,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Row(
                                    children: [
                                      Text('Entry A'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            "Color",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Text('Entry A'),
                                Text('Entry A'),
                                Text('Entry A')
                              ],
                            ),
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Text(widget.product.description),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.black,
            child: Icon(Icons.shopping_basket),
            onPressed: () {
              AddItemToCart(widget.product);
            },
          ),
        ),
      ),
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  StarDisplay({this.value = 0})
      : assert(value != null),
        super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.orange,
        );
      }),
    );
  }
}
