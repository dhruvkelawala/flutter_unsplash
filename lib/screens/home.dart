import 'package:flutter/material.dart';
import 'package:flutter_unsplash/widgets/paginated_grid.dart';
import '../services/api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> collectionID = [
    '139386',
    '1580860',
  ];

  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f1012),
      appBar: AppBar(
        backgroundColor: Color(0xFF9400d3),
        title: Text("Flutter Unsplash"),
        bottom: TabBar(
          onTap: (value) {
            setState(() {
              val = value;
            });
          },
          tabs: [
            Tab(text: "Pets"),
            Tab(text: "Nature"),
          ],
          labelStyle: TextStyle(
            fontSize: 20,
          ),
          // indicator: ,
        ),
      ),
      body: FutureBuilder(
        future: getPhotosByCollection(collectionID[val]),
        initialData: {},
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState != ConnectionState.done
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PaginatedGrid(
                  collectionID[val],
                );
        },
      ),
      // body: PaginatedGrid(
      //   collectionID[val],
      // ),
    );
  }
}
