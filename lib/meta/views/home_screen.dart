import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/core/model/playlist.model.dart';
import 'package:musify/core/model/songs.model.dart';
import 'package:musify/core/router/router_generator.dart';
import 'package:musify/meta/utils/app_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<PlaylistsModel> playlistList = [
    PlaylistsModel(
        name: 'Playlist 1',
        playlistId: '1',
        description: 'This is playlist 1',
        imagePath: 'assets/images/playlist1.jpg'),
    PlaylistsModel(
        name: 'Playlist 2',
        playlistId: '2',
        description: 'This is playlist 2',
        imagePath: 'assets/images/playlist2.jpg'),
    PlaylistsModel(
        name: 'Playlist 3',
        playlistId: '3',
        description: 'This is playlist 3',
        imagePath: 'assets/images/playlist3.jpg'),
    PlaylistsModel(
        name: 'Playlist 4',
        playlistId: '4',
        description: 'This is playlist 4',
        imagePath: 'assets/images/playlist4.jpg'),
    PlaylistsModel(
        name: 'Playlist 5',
        playlistId: '5',
        description: 'This is playlist 5',
        imagePath: 'assets/images/playlist5.jpg')
  ];

  List<SongsModel> songsList = [
    SongsModel(
        songId: '1',
        songTitle: 'Song 1',
        songGenre: 'Genre 1',
        songUrl: 'assets/songs/song1.mp3',
        songName: 'Song 1',
        songDescription: 'This is song 1'),
    SongsModel(
        songId: '2',
        songTitle: 'Song 2',
        songGenre: 'Genre 2',
        songUrl: 'assets/songs/song2.mp3',
        songName: 'Song 2',
        songDescription: 'This is song 2'),
    SongsModel(
        songId: '3',
        songTitle: 'Song 3',
        songGenre: 'Genre 3',
        songUrl: 'assets/songs/song3.mp3',
        songName: 'Song 3',
        songDescription: 'This is song 3'),
    SongsModel(
        songId: '4',
        songTitle: 'Song 4',
        songGenre: 'Genre 4',
        songUrl: 'assets/songs/song4.mp3',
        songName: 'Song 4',
        songDescription: 'This is song 4'),
    SongsModel(
        songId: '5',
        songTitle: 'Song 5',
        songGenre: 'Genre 5',
        songUrl: 'assets/songs/song5.mp3',
        songName: 'Song 5',
        songDescription: 'This is song 5')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBar(
          title: Text(''),
          automaticallyImplyLeading: false,
        ),
        actions: [
          InkWell(
            onTap: () {
              navigationController.navigateToNamed(RouteGenerator.profile);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person_outline_rounded,
                size: 30,
                color: Colors.amber,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Playlists",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: playlistList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 10, bottom: 10),
                        child: Image.asset(Assets.splashLogo,
                            width: 100, height: 100),
                      ),
                      Text(
                        "Playlist 1",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Artists",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 10, bottom: 10),
                        child: Image.asset(Assets.splashLogo,
                            width: 100, height: 100),
                      ),
                      Text(
                        "Artists 1",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: AppTheme.primaryColor,
                            ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
