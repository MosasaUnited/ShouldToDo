import 'package:flutter/material.dart';
import 'package:should_todo/core/theming/images.dart';
import 'package:should_todo/features/home/ui/widgets/exit_show_dialog.dart';
import 'package:should_todo/features/tasks/add_tasks.dart';

import '../done_tasks/done_tasks.dart';
import '../settings/settings_screen.dart';
import '../todo_tasks/todo_tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const AddTasks(),
    const ToDoTasks(),
    const DoneTasks(),
    const SettingsScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShouldToDo'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppImages.appImage,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ExitShowDialog();
                },
              );
            },
            icon: Image.asset(
              AppImages.exitIconImage,
              cacheHeight: 25,
              cacheWidth: 25,
            ),
          )
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade700,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_alt,
              color: Colors.blueAccent,
            ),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.today,
                color: Colors.blueAccent,
              ),
              label: 'TODO Tasks'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done_all,
              color: Colors.blueAccent,
            ),
            label: 'Done Tasks',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.blueAccent,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
