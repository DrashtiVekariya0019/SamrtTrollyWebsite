import 'package:SmartTrolleyWebsite/View/Authentication/SignUpPage.dart';
import 'package:SmartTrolleyWebsite/View/Benefitspage/Benefitspage.dart';
import 'package:SmartTrolleyWebsite/View/ContactPages/ContactPage.dart';
import 'package:SmartTrolleyWebsite/View/Featurespages/Featurespage.dart';
import 'package:SmartTrolleyWebsite/View/HowItWorkpages/HowItWorkpage.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/GlobayKeyPage.dart';
import 'package:SmartTrolleyWebsite/main.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String features='/features';
  static const String howitwork='/howitwork';
  static const String benefits='/benefits';
  static const String  contacts='/contacts';
  static const String  signup='/signup';



  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: home, page: () => MainPage(), transition: Transition.fadeIn),
    GetPage(
      name: features,
      page: () => FeaturesPage(onRequestDemoTap: () {  },),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: howitwork,
      page: () => HowItWorkPage(onRequestDemoTap: () {  },),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: benefits,
      page: () => BenefitsPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: contacts,
      page: () => ContactPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signup,
      page: () => SignUpPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
