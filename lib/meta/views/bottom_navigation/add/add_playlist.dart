import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/meta/utils/image_handler.dart';

class AddPlaylist extends StatefulWidget {
  const AddPlaylist({Key? key}) : super(key: key);

  @override
  State<AddPlaylist> createState() => _AddPlaylistState();
}

class _AddPlaylistState extends State<AddPlaylist> {
  Future<File>? uploadImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    return imageFile == null ? File('') : File(imageFile.path);
  }

  @override
  File? coverImage;
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
            child: coverImage == null
                ? Image.asset(
                    Assets.upload,
                    width: 250,
                    height: 250,
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.file(
                      coverImage!,
                      width: 250,
                      height: 250,
                    ),
                  ),
            onTap: () {
              ImageHandler.uploadPicture()!.then((value) {
                value.path == ''
                    ? null
                    : setState(() {
                        coverImage = value;
                      });
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Playlist Name",
                labelStyle: TextStyle(color: Colors.amber),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0))),
          ),
          SizedBox(
            height: 20,
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
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
