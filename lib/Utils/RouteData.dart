
import 'package:AivoCartsWebsite/View/Authentication/SignUpPage.dart';
import 'package:AivoCartsWebsite/View/Benefitspage/Benefitspage.dart';
import 'package:AivoCartsWebsite/View/BlogPages/Blogpage.dart';
import 'package:AivoCartsWebsite/View/ContactPages/ContactPage.dart';
import 'package:AivoCartsWebsite/View/Featurespages/Featurespage.dart';
import 'package:AivoCartsWebsite/View/HowItWorkpages/HowItWorkpage.dart';
import 'package:AivoCartsWebsite/View/Navigationpage/GlobayKeyPage.dart';
import 'package:AivoCartsWebsite/main.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String features='/features';
  static const String howitwork='/howitwork';
  static const String benefits='/benefits';
  static const String blog='/blog';
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
      name: blog,
      page: () => BlogPage1Content(),
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
