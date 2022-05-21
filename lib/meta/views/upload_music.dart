import 'dart:io';

import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/core/notifier/auth_provider.notifier.dart';
import 'package:provider/provider.dart';

class UploadMusic extends StatefulWidget {
  String playlistName, playlistDescription;
  bool isFromPlaylist;
  File? playlistFile;
  String? playlistId;

  UploadMusic(
      {Key? key,
      required this.isFromPlaylist,
      required this.playlistName,
      required this.playlistDescription,
      this.playlistFile,
      this.playlistId})
      : super(key: key);

  @override
  State<UploadMusic> createState() => _UploadMusicState();
}

class _UploadMusicState extends State<UploadMusic> {
  final title = TextEditingController();
  final genre = TextEditingController();
  final desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Add Playlist",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              child: Text(
                "Next",
                style: TextStyle(color: Colors.amber, fontSize: 18),
              ),
              onTap: () => print("Next Button Called"),
            ),
          )
        ],
      ),
      body: Column(children: [
        InkWell(
          child: Image.asset(Assets.splashLogo),
          onTap: () {
            context.read<AuthProviderNotifier>().createPlayListAndSong(
                widget.isFromPlaylist,
                playlistId: widget.playlistId ?? '',
                playListName: widget.playlistName,
                playlistDescription: widget.playlistDescription,
                songName: title.text.trim(),
                songGenre: genre.text.trim(),
                description: desc.text.trim());
          },
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "Title",
              labelStyle: TextStyle(color: Colors.amber),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "Genre",
              labelStyle: TextStyle(color: Colors.amber),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          minLines: 2,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            labelText: "Description",
            labelStyle: TextStyle(color: Colors.amber),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Upload"),
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  primary: Colors.amber,
                  onPrimary: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Record"),
              style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  primary: Colors.black,
                  onPrimary: Colors.white),
            )
          ],
        )
      ]),
    );
  }
}
