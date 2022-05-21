import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Song Title",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "By Artist",
              style: TextStyle(color: Colors.amber, fontSize: 22),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  height: 50, width: 50, child: Image.asset(Assets.splashLogo)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0)),
                  child: Container(
                    color: Color.fromRGBO(51, 29, 29, 50),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Hello this is me",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0)),
                  child: Container(
                    color: Color.fromRGBO(51, 29, 29, 50),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Post a comment",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.send,
                    color: Colors.amber,
                    size: 50,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
