// import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import './feed_screen.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {String altDescription,
      String photo,
      String userName,
      String name,
      String heroTag,
      String userPhoto,
      Key key})
      : this.photoLink = photo,
        this.altDescription = altDescription,
        this.userName = userName,
        this.name = name,
        this.heroTag = heroTag,
        this.userPhoto = userPhoto,
        super(key: key);

  final String photoLink;
  final String userName;
  final String name;
  final String altDescription;
  final String heroTag;
  final String userPhoto;

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> __avatarOpacity;
  Animation<double> __userNameOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this)
      ..forward();
    //_controller = Tween(begin: 0, end: 1.0).animate(_controller);

    __avatarOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    __userNameOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                // icon: Icon(Icons.chevron_left),
                icon: Icon(CupertinoIcons.back),
                tooltip: 'back',
                onPressed: () {
                  Navigator.pop(context);
                });
          }),
          title: Text('Photo')),
      Hero(tag: widget.heroTag, child: Photo(photoLink: kFlutterDash)),
      AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return Row(children: <Widget>[
              Container(
                  child: Opacity(
                      opacity: __avatarOpacity.value,
                      child: UserAvatar(widget.userPhoto))),
              SizedBox(
                width: 6,
              ),
              Container(
                  child: Opacity(
                      opacity: __userNameOpacity.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.name == null ? '' : widget.name),
                          Text(widget.userName == null
                              ? ''
                              : '@' + widget.userName),
                          Text(widget.altDescription == null
                              ? ''
                              : widget.altDescription)
                        ],
                      )))
            ]);
          })
    ]));
  }
}
