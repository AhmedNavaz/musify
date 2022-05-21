import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/meta/utils/app_theme.dart';

class MediaPlayerView extends StatefulWidget {
  const MediaPlayerView({Key? key}) : super(key: key);

  @override
  State<MediaPlayerView> createState() => _MediaPlayerViewState();
}

class _MediaPlayerViewState extends State<MediaPlayerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "Song Title",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 30),
              ),
              Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
            ],
          ),
          Text(
            "By Artist",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppTheme.primaryColor),
          ),
          Image.asset(Assets.splashLogo, width: 200, height: 200),
        ],
      ),
    );
  }
}
