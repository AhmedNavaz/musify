import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/core/router/router_generator.dart';
import 'package:musify/meta/utils/app_theme.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  var _selectedGender;

  List<String> genderImages = [Assets.male, Assets.femail, Assets.other];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                navigationController.getOff(RouteGenerator.loginScreen);
              },
              child:
                  Text("Sign In", style: Theme.of(context).textTheme.bodyText1))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Image.asset(
                    Assets.splashLogo,
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text("Musify", style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Name',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gender",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppTheme.primaryColor),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Image.asset(genderImages[i]),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: Text(
                      "I would like to receive your newsletter and other promotional information.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: AppTheme.primaryColor,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a Snackbar.
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: AppTheme.primaryColor,
                        minimumSize: Size(400, 50)),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
