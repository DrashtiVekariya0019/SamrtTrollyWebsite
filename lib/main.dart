import 'package:SmartTrolleyWebsite/Utils/RouteData.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/GlobayKeyPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      title: 'IoTrolley',

      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,

        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MainPage(),);
  }
}

