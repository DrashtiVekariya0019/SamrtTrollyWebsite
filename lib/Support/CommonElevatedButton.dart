import 'package:SmartTrolleyWebsite/Support/CommonTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CommonElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CommonElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
