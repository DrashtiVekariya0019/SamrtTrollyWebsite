import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samrttrollywebsite/Utils/AppColors.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: widget.onTap,
          hoverColor: Colors.grey.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,

                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavDropdownItem extends StatefulWidget {
  final String title;
  final List<String> items;

  const NavDropdownItem({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  State<NavDropdownItem> createState() => _NavDropdownItemState();
}

class _NavDropdownItemState extends State<NavDropdownItem> {
  // final NavigationController navigationController =
  // Get.put(NavigationController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // navigationController.onInit();
  }

  void _handleNavigation(String item) {

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: PopupMenuButton<String>(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.black,
            ),
          ],
        ),
        itemBuilder: (context) => widget.items
            .map(
              (item) => PopupMenuItem(
            value: item,
            child: Text(
              item,
              style:TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
        )
            .toList(),
        onSelected: (value) {
          setState(() {
            _handleNavigation(value);
          });
        },
      ),
    );
  }
}
