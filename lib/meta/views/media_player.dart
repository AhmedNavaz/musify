import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/meta/utils/app_theme.dart';
import 'package:audioplayers/audioplayers.dart';

class MediaPlayerView extends StatefulWidget {
  const MediaPlayerView({Key? key}) : super(key: key);

  @override
  State<MediaPlayerView> createState() => _MediaPlayerViewState();
}

class _MediaPlayerViewState extends State<MediaPlayerView>
    with SingleTickerProviderStateMixin {
  late AudioPlayer audioPlayer;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  final String path =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
          begin: Offset.zero, end: const Offset(0, 0.08))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "By Artist",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppTheme.primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(Assets.splashLogo, width: 400, height: 400),
            ),
            InkWell(
              child: Icon(
                Icons.play_arrow,
                color: AppTheme.primaryColor,
                size: 50,
              ),
              onTap: () async {
                if (!isPlaying && !isPaused) {
                  ByteData bytes = await rootBundle.load(path);
                  Uint8List soundbytes = bytes.buffer
                      .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                  await audioPlayer.play(path, isLocal: false);
                  setState(() {
                    isPlaying = true;
                  });
                } else if (isPlaying) {
                  audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                    isPaused = true;
                  });
                } else if (!isPlaying && isPaused) {
                  audioPlayer.resume();
                  setState(() {
                    isPlaying = true;
                    isPaused = false;
                  });
                }
              },
            ),
            Slider(
                activeColor: AppTheme.primaryColor,
                inactiveColor: AppTheme.primaryColor.withOpacity(0.5),
                min: 0.0,
                max: _duration.inSeconds.toDouble(),
                value: _position.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    changeToSecond(value.toInt());
                    value = value;
                  });
                }),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              alignment: Alignment.bottomLeft,
              child: Text(
                _position.toString().split(".")[0],
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 14, color: AppTheme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
