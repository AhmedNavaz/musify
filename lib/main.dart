import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/providers/multi_providers.dart';
import 'core/controller/navigation_controller.dart';
import 'core/notifier/connection.notifier.dart';
import 'core/router/router_generator.dart';
import 'meta/utils/app_theme.dart';
import 'meta/utils/hive_database.dart';
import 'meta/utils/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INITIALIZING IMPORTANT DEPENDENCIES
  Get.put(NavigationController());
  await SharedPref.init();
  await ConnectionNotifier().initConnectivity();
  await HiveDatabase.init();
  await Firebase.initializeApp();
  // ENTRY POINT TO THE APP
  runApp(const MusifyApp());
}

class MusifyApp extends StatefulWidget {
  const MusifyApp({Key? key}) : super(key: key);

  @override
  State<MusifyApp> createState() => _MusifyAppState();
}

class _MusifyAppState extends State<MusifyApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ScreenUtilInit(
          builder: (_, w) => MultiProviders(
                GetMaterialApp(
                  title: "Musify",
                  debugShowCheckedModeBanner: false,
                  initialRoute: RouteGenerator.welcomeScreen,
                  onGenerateRoute: RouteGenerator.onGeneratedRoutes,
                  theme: AppTheme.lightTheme,
                ),
              )),
    );
  }
}
