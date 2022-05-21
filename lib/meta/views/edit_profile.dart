import 'package:flutter/material.dart';
import 'package:musify/core/model/auth_model.dart';
import 'package:musify/core/notifier/auth_provider.notifier.dart';
import 'package:musify/meta/utils/hive_database.dart';
import 'package:provider/provider.dart';

import '../utils/app_theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // nameController.text = context.read<AuthProviderNotifier>().currentUser.username!;
    passController.text = HiveDatabase.getValue(HiveDatabase.pass);
  }

  bool passShow = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                onTap: (){
                  context.read<AuthProviderNotifier>().updateMyDetails(context, AuthModel(email: context.read<AuthProviderNotifier>().currentUser.email, username: nameController.text.trim(), password: passController.text.trim() ));
                },
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
              controller: nameController,
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
              obscureText: !passShow,
              controller: passController,
              decoration: InputDecoration(
                  suffix: GestureDetector(onTap: (){
                    setState(() {
                      passShow = !passShow;
                    });
                  },child: Text( passShow ? "Hide" : "Show", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppTheme.primaryColor),)),

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
