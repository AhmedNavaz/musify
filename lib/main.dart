import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/constants/controller.dart';
import 'package:musify/controllers/navigation_controller.dart';
import 'package:musify/router/router_generator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  Get.put(NavigationController());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: root,
      onGenerateRoute: RouteGenerator.onGeneratedRoutes,
      defaultTransition: Transition.zoom,
      navigatorKey: navigationController.navigationKey,
    );
  }
}
