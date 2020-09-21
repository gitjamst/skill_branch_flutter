import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String photoLink;
  final String userName;
  final String name;
  final String altDescription;

  const FullScreenImage(
      {Key key, this.photoLink, this.userName, this.name, this.altDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: Icon(CupertinoIcons.back),
              tooltip: 'back',
              onPressed: () {
                Navigator.pop(context);
              });
        }),
      ),
      body: Column(
        children: [
          Photo(photoLink: kFlutterDash),
          Text(this.name == null ? '' : this.name),
          Text(this.userName == null ? '' : '@' + this.userName),
          Text(
            this.altDescription == null ? '' : this.altDescription,
            maxLines: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: GestureDetector(
              child: Row(children: [
                MyButton('Save', () => debugPrint("Save")),
                MyButton('Visit', () => debugPrint("Visit")),
              ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton(String text, Function onPress, {Key key})
      : this.text = text,
        this.onPress = onPress,
        super(key: key);

  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: RaisedButton(
          onPressed: this.onPress,
          child: Text(this.text, style: TextStyle(fontSize: 15)),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
