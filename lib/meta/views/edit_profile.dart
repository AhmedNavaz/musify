import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.text = "abcd@abcd.com";
    passController.text = "password123";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                onTap: () => print("Save Button Pressed"),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            "Edit Profile",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("./assets/placeholder.png"),
            backgroundColor: Colors.black12,
          ),
          Text(
            "Username",
            style: TextStyle(color: Colors.amberAccent, fontSize: 28),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  suffixText: "edit",
                  filled: true,
                  labelStyle: TextStyle(color: Colors.amber),
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
          Text(
            "Password",
            style: TextStyle(color: Colors.amberAccent, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                  suffixText: "edit",
                  labelStyle: TextStyle(color: Colors.amber),
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
        ]),
      ),
    );
  }
}
