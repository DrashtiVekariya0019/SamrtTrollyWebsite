// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:samrttrollywebsite/Support/CommonTextStyle.dart';
// import 'package:samrttrollywebsite/Utils/AppColors.dart';
//
// class DrawerItem extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;
//
//   const DrawerItem({
//     super.key,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         title,
//         style: AppTextStyles.customStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w600,
//           color: AppColors.black,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }
//
// class DrawerExpansionItem extends StatefulWidget {
//   final String title;
//   final List<String> children;
//   const DrawerExpansionItem({
//     super.key,
//     required this.title,
//     required this.children,
//   });
//
//   @override
//   State<DrawerExpansionItem> createState() => _DrawerExpansionItemState();
// }
//
// class _DrawerExpansionItemState extends State<DrawerExpansionItem> {
//   // final NavigationController navigationController =
//   // Get.put(NavigationController());
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     //  navigationController.onInit();
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: Text(
//         widget.title,
//         style: AppTextStyles.customStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: AppColors.white,
//         ),
//       ),
//       children: widget.children
//           .map(
//             (child) => ListTile(
//           contentPadding: const EdgeInsets.only(left: 32),
//           title: Text(child,
//               style: AppTextStyles.customStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.white,
//               )),
//           onTap: () {
//             Navigator.pop(context); // Close the drawer
//             // _handleNavigation(child); // Navigate to the selected page
//           },
//         ),
//       )
//           .toList(),
//     );
//   }
// }
