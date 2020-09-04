import '../res/app_icons.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;

  const LikeButton({Key key, this.likeCount, this.isLiked}) : super(key: key);
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked;
  int likeCount;

  @override
  void initState() {
    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          isLiked = !isLiked;
          if (isLiked) {
            likeCount++;
          } else {
            likeCount--;
          }
        });
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
              SizedBox(
                width: 4.21,
              ),
              Text('$likeCount'),
            ],
          ),
        ),
      ),
    );
  }
}
