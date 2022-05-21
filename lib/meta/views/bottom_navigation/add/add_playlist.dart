import 'package:flutter/material.dart';

class AddPlaylist extends StatefulWidget {
  const AddPlaylist({Key? key}) : super(key: key);

  @override
  State<AddPlaylist> createState() => _AddPlaylistState();
}

class _AddPlaylistState extends State<AddPlaylist> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Add Playlist",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            InkWell(
              child: Image.asset("./assets/uploadimage.jpg"),
              onTap: () => print("Upload Function Called."),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      primary: Colors.amber,
                      onPrimary: Colors.white),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
