import 'package:flutter/material.dart';
import 'package:samrttrollywebsite/Support/CommonTextStyle.dart';
import 'package:samrttrollywebsite/Utils/AppColors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child:  Text(
        'Copyright © 2024-25 Netpair Infotech LLP. All rights reserved',
        style: AppTextStyles.customStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
