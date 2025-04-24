// import 'package:flutter/material.dart';
// import 'package:samrttrollywebsite/Support/CommonTextStyle.dart';
// import 'package:samrttrollywebsite/Utils/AppColors.dart' show AppColors;
// import 'package:samrttrollywebsite/View/Navigationpage/MobileDrawer.dart';
//
// class Appbar extends StatelessWidget {
//   final Widget body;
//
//   const Appbar({super.key, required this.body});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < 600) {
//           // 🔹 Mobile View — Keep AppBar
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColors.white,
//               elevation: 0,
//               title: Text(
//                 'SmartTrolley',
//                 style: AppTextStyles.customStyle(
//                   color: AppColors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               iconTheme:  IconThemeData(color: AppColors.black),
//             ),
//             drawer: const MobileDrawer(),
//             body: body,
//           );
//         } else {
//
//           return body;
//         }
//       },
//     );
//   }
// }
