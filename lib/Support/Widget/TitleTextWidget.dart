import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:SmartTrolleyWebsite/Utils/AppColors.dart';
import 'package:flutter/material.dart';


class TitleTextWidget extends StatelessWidget {
  final String title;
  final double titleFontSize;

  const TitleTextWidget(
      {super.key, required this.title, required this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: AppColors.defaultColor,
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.customStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
