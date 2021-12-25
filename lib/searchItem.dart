import 'package:flutter/material.dart';
import 'selectedItem.dart';
import 'main.dart';

class SearchItemsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Search Products"),
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.view_list),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.grid_view),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text("Filter"),
                      onTap: () => print("object"),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      child: Text("Filter"),
                      onTap: () => print("object"),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (115 / 150),
                children: new List<Widget>.generate(
                  10,
                  (index) {
                    return new GridTile(
                      child: new Container(
                        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                        color: Colors.blue.shade200,
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
                              Image(
                                image: NetworkImage(
                                    'https://cdn.dribbble.com/users/879147/screenshots/6588256/image.png'),
                              ),
                              Text("FRANCE AUTHENTIC HOME JERSEY 2018"),
                              Text("NIKE"),
                              Row(
                                children: [
                                  Text(r"$130"),
                                  Text("ADD TO CART"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
