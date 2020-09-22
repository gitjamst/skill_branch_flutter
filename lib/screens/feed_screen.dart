import 'package:FlutterGalleryApp/screens/photo_screen.dart';

import '../res/res.dart';
import '../widgets/like_button.dart';
import '../widgets/photo.dart';
import '../widgets/user_avatar.dart';
import 'package:flutter/material.dart';

const String kFlutterDash =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {
  const Feed({Key key}) : super(key: key);
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Hero(tag: index, child: _buildItem(index)),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                ),
              ],
            );
          }),
    );
  }

  Widget _buildItem(int tag) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Photo(photoLink: kFlutterDash),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                        name: "name",
                        userName: "user name",
                        userPhoto:
                            'https://skill-branch.ru/img/speakers/Adechenko.jpg',
                        photo: kFlutterDash,
                        heroTag: tag.toString())));
          },
        ),
        _buildPhotometa(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'This is flutter dash. I like him :)',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.manatee),
          ),
        ),
      ],
    );
  }
}

Widget _buildPhotometa() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kirill Adreshenko', style: AppStyles.h5Black),
                Text('@kaparray',
                    style:
                        AppStyles.h5Black.copyWith(color: AppColors.manatee)),
              ],
            ),
          ],
        ),
        LikeButton(likeCount: 10, isLiked: true),
      ],
    ),
  );
}
