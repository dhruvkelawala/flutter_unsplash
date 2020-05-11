import 'package:flutter/material.dart';
import 'package:flutter_unsplash/widgets/paginated_grid.dart';
import '../services/api.dart';

class Home extends StatelessWidget {
  @override
  final List<String> collectionID = [
    '139386',
    '1580860',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f1012),
      appBar: AppBar(
        backgroundColor: Color(0xFF9400d3),
        title: Text("Flutter Unsplash"),
        bottom: TabBar(
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
      body: TabBarView(
        children: [
          FutureBuilder(
            future: getPhotosByCollection(collectionID[0]),
            initialData: {},
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.connectionState != ConnectionState.done
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : PaginatedGrid(
                      collectionID[0],
                    );
            },
          ),
          FutureBuilder(
            future: getPhotosByCollection(collectionID[1]),
            initialData: {},
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.connectionState != ConnectionState.done
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : PaginatedGrid(collectionID[1]);
            },
          ),
        ],
      ),
    );
  }
}
