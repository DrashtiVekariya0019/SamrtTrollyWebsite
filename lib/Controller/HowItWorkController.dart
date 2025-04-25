import 'package:get/get.dart';

class HowItWorkController extends GetxController {
  final List<Map<String, String>> steps = [
    {
      "title": "Scan & Login",
      "desc":
      "Shoppers scan a QR code or tap their loyalty card on the trolley’s built-in scanner to activate and personalize their shopping experience.",
      "img": "assets/Images/scan&login.png",
    },
    {
      "title": "Shop & Scan",
      "desc":
      "As items are placed in the trolley, built-in cameras and weight sensors automatically detect products, adding them to your virtual cart.",
      "img": "assets/Images/shopandscan.jpg",
    },
    {
      "title": "Review & Modify",
      "desc":
      "The integrated touchscreen display shows your items in real-time, allowing you to review your cart, adjust quantities, or remove items.",
      "img": "assets/Images/reviewandmodify.png",
    },
    {
      "title": "Pay & Go",
      "desc":
      "Skip the checkout line! Pay directly on the trolley using contactless payment methods and exit the store without waiting.",
      "img": "assets/Images/payandgo.png",
    },
  ];
}
