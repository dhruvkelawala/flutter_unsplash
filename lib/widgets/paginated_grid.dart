import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unsplash/models/photo.dart';
import 'package:flutter_unsplash/services/api.dart';
import 'package:pagination_view/pagination_view.dart';

class PaginatedGrid extends StatelessWidget {
  // final data;
  final String collectionID;

  PaginatedGrid(this.collectionID);

  @override
  Widget build(BuildContext context) {
    return PaginationView<Photo>(
      pageFetch: (int page) => page != 1
          ? getPhotosByCollection(
              collectionID,
              page: page,
            )
          : null,
      paginationViewType: PaginationViewType.gridView,
      itemBuilder: (BuildContext context, Photo photo, int index) {
        return Container(
          height: 300,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: CachedNetworkImageProvider(
                        photo.thumbnail,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  photo.description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      onError: (dynamic error) => Center(
        child: Text('Some error occured'),
      ),
      onEmpty: Center(
        child: Text('Sorry! This is empty'),
      ),
      bottomLoader: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
