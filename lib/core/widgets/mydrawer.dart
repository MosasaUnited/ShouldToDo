import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_router.dart';

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
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/app_icon.png',
                  height: 100.h,
                ),
                const Text(
                  'Should ToDo',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.task_alt,
              color: Colors.blue,
            ),
            title: const Text(
              'Add Task',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).push(AppRouter.kTasks);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.done_all_outlined,
              color: Colors.blue,
            ),
            title: const Text(
              'Done Tasks',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).push(AppRouter.kDoneTasks);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.storage,
              color: Colors.blue,
            ),
            title: const Text(
              'Archived Tasks',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              GoRouter.of(context).push(AppRouter.kArchivedTasks);
            },
          ),
        ],
      ),
    );
  }
}
