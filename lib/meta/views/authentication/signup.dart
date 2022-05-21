import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/components/custom_snackbar.dart';
import 'package:musify/core/model/auth_model.dart';
import 'package:musify/core/model/uploads.model.dart';
import 'package:musify/core/notifier/auth_provider.notifier.dart';
import 'package:musify/core/router/router_generator.dart';
import 'package:musify/meta/utils/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/strings.constant.dart';

class SignupView extends StatefulWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  bool passShow = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String _selectedGender = '';
  bool newsCheck = true;
  int currentSelected = -1 ;

  List<String> genderImages = [Assets.male, Assets.femail, Assets.other];
  bool pressed = false;

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(currentSelected == -1){
      CustomSnackBar.showErrorSnackBar(title: 'Please select your gender', message: '');
      return;
    }
    if (isValid) {
      // TODO :: REQUEST CALL

      setState(() {
        pressed = true;
      });

      bool success = await context.read<AuthProviderNotifier>().signup(AuthModel(username: nameController.text.trim(), email: emailController.text.trim(), password: passwordController.text.trim(), gender: _selectedGender, uploads: UploadsModel(uploadId: "", artistName: "", artistUid: "", playlists: [], songs: [])));

      if(success){
        navigationController.getOffAll(RouteGenerator.home);
      }

      setState(() {
        pressed = false;
      });

    }
  }


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
                    controller: nameController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Name',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username cannot be empty';
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
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email Cannot be empty';
                      }
                      if (!emailValidate.hasMatch(value)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !passShow,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                      suffix: GestureDetector(onTap: (){
                        setState(() {
                          passShow = !passShow;
                        });
                      },child: Text( passShow ? "Hide" : "Show", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppTheme.primaryColor),)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Invalid password';
                      }
                      if (value.length <= 6) {
                        return "Password should be at least 6 characters";
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
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              currentSelected = i;
                            });
                            genderSelection(i);
                          },
                          child: Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: currentSelected == i ? AppTheme.primaryColor : Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Image.asset(genderImages[i]),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CheckboxListTile(
                    checkColor: Colors.white,
                    selectedTileColor: Colors.white,
                    value: newsCheck,
                    onChanged: (value) {
                      setState(() {
                        newsCheck = !newsCheck;
                      });
                    },
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
                    onPressed: pressed ? () => null : _trySubmit,
                    style: ElevatedButton.styleFrom(
                        primary: pressed
                            ? AppTheme.lightBackgroundColor
                            : AppTheme.primaryColor,
                        minimumSize: const Size(400, 50)),
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: 0.02.sh,)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
  genderSelection(int gen){
    if(gen == 0){
      _selectedGender = "Male";
    }else if(gen == 1){
      _selectedGender = "Female";
    }else{
      _selectedGender = "Other";
    }
  }

}
