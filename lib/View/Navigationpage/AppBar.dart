import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:SmartTrolleyWebsite/View/Navigationpage/MobileDrawer.dart';
import 'package:flutter/material.dart';


class Appbar extends StatelessWidget {
  final Widget body;

  const Appbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          // 🔹 Mobile View — Keep AppBar
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              title: Text(
                'IOTrolley',
                style: AppTextStyles.customStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              iconTheme:  IconThemeData(color: AppColors.black),
            ),
            drawer: Drawer(
              child: MobileDrawer(),
            ),
            body: body,
          );
        } else {

          return body;
        }
      },
    );
  }
}
