import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/core/model/song.dart';
import 'package:musify/meta/utils/app_theme.dart';

class MusicInfoWidget extends StatelessWidget {
  MusicInfoWidget({
    Key? key,
    this.song,
  }) : super(key: key);

  Song? song;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.asset(Assets.splashLogo, width: 75, height: 75),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song!.title!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  song!.artist!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              song!.duration!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 14, color: Colors.white70),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Icon(
              Icons.more_vert,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
