import 'package:cached_network_image/cached_network_image.dart';

import '../res/colors.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String photoLink;

  const Photo({Key key, this.photoLink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      //Умеет округлять любой компонент
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: Container(
          color: AppColors.grayChateau,
          child: CachedNetworkImage(
            imageUrl: photoLink,
            //Берем из примера на странице библиотеки
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            //Будет растягиваться на высоту контейнера
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
