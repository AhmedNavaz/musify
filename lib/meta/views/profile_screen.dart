import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        actions: [
          InkWell(
              child: Icon(
                Icons.edit,
                color: Colors.amber,
              ),
              onTap: () => print("Something happend")),
        ],
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.black12,
              backgroundImage: AssetImage("assets/placeholder.png"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Username",
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 28,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Email ",
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Playlists : 4",
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Songs : 4",
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
