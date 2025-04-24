import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samrttrollywebsite/Utils/RouteData.dart';
import 'package:samrttrollywebsite/View/Navigationpage/GlobayKeyPage.dart';


void main() {
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
      title: 'Netpair Chocolet pvt ltd',

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

