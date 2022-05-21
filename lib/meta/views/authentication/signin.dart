import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/components/custom_snackbar.dart';
import 'package:musify/core/router/router_generator.dart';
import 'package:musify/meta/utils/app_theme.dart';
import 'package:musify/meta/utils/hive_database.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/strings.constant.dart';
import '../../../core/model/auth_model.dart';
import '../../../core/notifier/auth_provider.notifier.dart';

class SigninView extends StatefulWidget {
  SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _formKey = GlobalKey<FormState>();
  bool pressed = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passShow = false;

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      // TODO :: REQUEST CALL

      setState(() {
        pressed = true;
      });

      bool success = await context.read<AuthProviderNotifier>().login(AuthModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));

      if (success) {
        navigationController.getOffAll(RouteGenerator.home);
        HiveDatabase.storeValue(HiveDatabase.pass, passwordController.text.trim());
        CustomSnackBar.showSuccessSnackBar(title: 'Login Successful', message: "");
        print("TRUE");
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
                navigationController.getOff(RouteGenerator.signupScreen);
              },
              child:
                  Text("Sign Up", style: Theme.of(context).textTheme.bodyText1))
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
                    controller: emailController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppTheme.primaryColor),
                    ),
                    validator: (str) {
                      if (str == '' || str == null) {
                        return "Required*";
                      }

                      if (!emailValidate.hasMatch(str)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      suffix: GestureDetector(onTap: (){
                        setState(() {
                          passShow = !passShow;
                        });
                      },child: Text( passShow ? "Hide" : "Show", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppTheme.primaryColor),)),
                      labelStyle: const TextStyle(color: AppTheme.primaryColor),
                    ),
                    obscureText: !passShow,
                    validator: (str) {
                      if (str == '' || str == null) {
                        return "Required*";
                      }
                      if (str.length <= 6) {
                        return "Password should be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ElevatedButton(
                    onPressed: pressed ? () => null : _trySubmit,
                    style: ElevatedButton.styleFrom(
                        primary: pressed
                            ? AppTheme.lightBackgroundColor
                            : AppTheme.primaryColor,
                        minimumSize: const Size(400, 50)),
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text("Forgot your password?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppTheme.primaryColor)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
