import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectedItem extends StatefulWidget {
  SelectedItem({Key? key, this.imageUrl}) : super(key: key);
  var imageUrl;

  @override
  State<SelectedItem> createState() => _ItemPageState();
}

class _ItemPageState extends State<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
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
              icon: const Icon(Icons.favorite, size: 30, color: Colors.orange),
              onPressed: () {
                print("Added to linked");
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color.fromRGBO(243, 243, 243, 1),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/${widget.imageUrl}",
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Image.asset(
                        "assets/images/${widget.imageUrl}",
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Image.asset(
                        "assets/images/${widget.imageUrl}",
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Image.asset(
                        "assets/images/${widget.imageUrl}",
                        fit: BoxFit.cover,
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              child: Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
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
                          Text(
                            "NIKE AIR MAX 200",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                r"$",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                "240",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          IconTheme(
                            data: IconThemeData(
                              color: Colors.amber,
                              size: 15,
                            ),
                            child: StarDisplay(value: 4),
                          ),
                        ],
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
                      Text(
                          "Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem IpsumLorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum Lorem Ipsum,  Ipsum."),
                    ],
                  ),
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
            foregroundColor: Colors.white,
            child: Icon(Icons.shopping_basket),
            onPressed: () {},
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
