import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musify/constants/controller.dart';
import 'package:musify/controllers/navigation_controller.dart';
import 'package:musify/router/router_generator.dart';

void main() {
  Get.put(NavigationController());
  WidgetsFlutterBinding.ensureInitialized();
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
