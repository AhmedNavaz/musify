import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)))),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              child: Text(
                "Recent Searches",
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
              onTap: () => print("Recent Search button tapped"),
            ),
          ),
          InkWell(
            child: ListTile(
              title: Text(
                "Song Name",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Artist",
                style: TextStyle(color: Colors.amber),
              ),
              leading: Image.asset(Assets.splashLogo),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.amber,
              ),
            ),
            onTap: () => print("List Tile Tapped"),
          ),
          InkWell(
            child: ListTile(
              title: Text(
                "Song Name",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Artist",
                style: TextStyle(color: Colors.amber),
              ),
              leading: Image.asset(Assets.splashLogo),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.amber,
              ),
            ),
            onTap: () => print("List Tile Tapped"),
          ),
          InkWell(
            child: ListTile(
              title: Text(
                "Song Name",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Artist",
                style: TextStyle(color: Colors.amber),
              ),
              leading: Image.asset(Assets.splashLogo),
              trailing: Icon(
                Icons.more_vert,
                color: Colors.amber,
              ),
            ),
            onTap: () => print("List Tile Tapped"),
          ),
        ],
      ),
    );
  }
}
