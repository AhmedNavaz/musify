import 'dart:async';

import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/core/notifier/connection.notifier.dart';
import 'package:provider/provider.dart';
import '../../utils/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectionNotifier>(context, listen: false).initConnectivity();
    Timer(const Duration(seconds: 3), () => checkState());
  }

  void checkState() {
    // TODO :: CHECK USER STATE HERE

    // LOGGED IN ? HOME PAGE : AUTH SCREEN
    // if(HiveDatabase.getValue(HiveDatabase.loginCheck) == true){
    //   navigationController.getOffAll(RouteGenerator.homePageRoot);
    //   context.read<AuthenticationNotifier>().loadUserProfile();
    // }else{
    //   navigationController.getOffAll(RouteGenerator.welcomeScreen);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.splashLogo),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            "Musify",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    ));
  }
}
