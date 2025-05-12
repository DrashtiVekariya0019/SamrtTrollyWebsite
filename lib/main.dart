import 'package:SmartTrolleyWebsite/Services/ApiFunction.dart';
import 'package:SmartTrolleyWebsite/Utils/RouteData.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/GlobayKeyPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// Function to initialize services
void initServices() async {
  print('Starting services...');
  // Initialize the ApiFunction (replacing ApiService)
  await Get.putAsync(() => ApiFunction().init());
  print('All services started...');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  initServices(); // Initialize services
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
    return Scaffold(
      body: MainPage(),
    );
  }
}
