import 'package:flutter/material.dart';

import 'main.dart';

class FilterItemsModel extends StatefulWidget {
  FilterItemsModel({Key? key, required this.filterByItem}) : super(key: key);
  var filterByItem;

  @override
  State<FilterItemsModel> createState() => _filterItemsModel();
}

class _filterItemsModel extends State<FilterItemsModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldColor,
      body: GridView.count(
        crossAxisCount: 2,
        children: new List<Widget>.generate(
          16,
          (index) {
            return new GridTile(
              child: new Card(
                  color: Colors.blue.shade200,
                  child: new Center(
                    child: new Text('tile $index'),
                  )),
            );
          },
        ),
      ),
    );
  }
}
