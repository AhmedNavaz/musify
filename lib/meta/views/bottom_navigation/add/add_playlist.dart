import 'dart:io';

import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/core/router/router_generator.dart';

class AddPlaylist extends StatefulWidget {
  String? playlistId;
  AddPlaylist({Key? key, this.playlistId}) : super(key: key);

  @override
  State<AddPlaylist> createState() => _AddPlaylistState();
}

class _AddPlaylistState extends State<AddPlaylist> {

  final playlistNameController = TextEditingController();
  final desController = TextEditingController();

  File? playListFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(
          "Add Playlist",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          InkWell(
            child: Image.asset(Assets.splashLogo),
            onTap: () => print("Upload Function Called."),
          ),
          SizedBox(height: 15,),
          TextField(
            controller: playlistNameController,
            decoration: InputDecoration(
                labelText: "Playlist Name",
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
            controller: desController,
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  navigationController.navigateToNamedWithArg(RouteGenerator.uploadMusic, {
                    "fromPlaylist": true,
                    "desc": desController.text.trim(),
                    "playlistName": playlistNameController.text.trim(),
                    "playlistFile": playListFile,
                    "playlistId":widget.playlistId ,
                  });
                },
                child: Text("Add Playlist"),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.amber,
                    onPrimary: Colors.white),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
