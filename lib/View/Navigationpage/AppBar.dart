
import 'package:AivoCartsWebsite/Utils/AppColors.dart';
import 'package:AivoCartsWebsite/View/Navigationpage/MobileDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Appbar extends StatelessWidget {
  final Widget body;

  const Appbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          // 🔹 Mobile View — Fixed drawer icon visibility
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                // title: Image.asset(
                //   'assets/Images/img.png',
                //   height: 80,
                // ),
                centerTitle: false,

                iconTheme: IconThemeData(color: Colors.black),

              ),
            ),
            drawer: Drawer(
              child: MobileDrawer(),
            ),
            body: Column(
              children: [
                // Divider line below AppBar
                Container(
                  height: 1,
                  color: Color(0xFF05203D),
                ),
                Expanded(
                  child: SafeArea(child: body),
                ),
              ],
            ),
          );
        } else {
          // 🔹 Desktop View
          return body;
        }
      },
    );
  }
}
