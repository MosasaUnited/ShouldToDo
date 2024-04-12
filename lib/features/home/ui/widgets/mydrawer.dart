import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(children: [
                Image.asset(
                  'assets/icons/app_icon.png',
                  height: 80.h,
                ),
                const Text(
                  'Should ToDo',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
