import 'package:ecommerce/models/fetchAsosProducts.dart';
import 'package:ecommerce/searchItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_cart/model/cart_model.dart';

var cart = FlutterCart();

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  var totalCost;

  void initState() {
    super.initState();
    totalCost = cart.getTotalAmount();
  }

  _incrementCounter(int productId) {
    setState(() {
      // cart.deleteItemFromCart(productId);
      cart.cartItem.removeWhere((item) => item.productId == productId);
      totalCost = cart.getTotalAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    var _card;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shopping",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          cart.cartItem.isEmpty
              ? Center(
                  child: Text("Add items to your cart"),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.cartItem.length,
                      itemBuilder: (context, index) {
                        final item = cart.cartItem[index];
                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            padding: EdgeInsets.only(right: 30.0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.delete,
                                ),
                              ],
                            ),
                          ),
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _incrementCounter(item.productId);
                          },
                          confirmDismiss:
                              (DismissDirection dismissDirection) async {
                            switch (dismissDirection) {
                              case DismissDirection.endToStart:
                                return await _showConfirmationDialog(
                                        context, 'Delete') ==
                                    true;
                              case DismissDirection.horizontal:
                              case DismissDirection.vertical:
                              case DismissDirection.up:
                              case DismissDirection.down:
                                assert(false);
                            }
                            return false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              bottom: 10,
                              right: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Image.network(
                                    cart.cartItem[index].productDetails,
                                    fit: BoxFit.fitWidth,
                                    height: 70,
                                    width: 50,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 0.0,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        "${cart.cartItem[index].productName}",
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Text(
                                      r"$" + "${cart.cartItem[index].subTotal}",
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${cart.cartItem[index].quantity}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          Divider(color: Colors.black),
          Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        r"$" + "${totalCost}",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  totalCost == 0
                      ? Text("")
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {},
                                child: Text('Checkout'),
                              ),
                            ),
                          ],
                        )
                ],
              ))
        ],
      ),
    );
  }
}

Future<dynamic> _showConfirmationDialog(BuildContext context, String action) {
  return showDialog<dynamic>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Do you want to $action this item?'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          FlatButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      );
    },
  );
}

AddItemToCart(Product product) async {
  var itemIndex = cart.findItemIndexFromCart(product.id);

  if (itemIndex != null) {
    cart.incrementItemToCart(itemIndex);
    ShoppingCart();
  } else {
    cart.addToCart(
      productId: product.id,
      unitPrice: double.tryParse(product.price),
      productName: product.title,
      quantity: 1,
      productDetailsObject: product.image,
    );
    ShoppingCart();
  }
}
