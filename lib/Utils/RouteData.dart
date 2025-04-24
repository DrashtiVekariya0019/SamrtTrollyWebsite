import 'package:get/get.dart';
import 'package:samrttrollywebsite/View/Benefitspage/Benefitspage.dart';
import 'package:samrttrollywebsite/View/ContactPages/ContactPage.dart';
import 'package:samrttrollywebsite/View/Featurespages/Featurespage.dart';
import 'package:samrttrollywebsite/View/Navigationpage/GlobayKeyPage.dart';
import 'package:samrttrollywebsite/View/HowItWorkpages/HowItWorkpage.dart';
import 'package:samrttrollywebsite/main.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String features='/features';
  static const String howitwork='/howitwork';
  static const String benefits='/benefits';
  static const String  contacts='/contacts';


  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: home, page: () => MainPage(), transition: Transition.fadeIn),
    GetPage(
      name: features,
      page: () => FeaturesPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: howitwork,
      page: () => HowItWorkPage(),
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
  ];
}
