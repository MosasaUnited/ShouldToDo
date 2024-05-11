import 'package:flutter/material.dart';
import 'package:should_todo/features/done/todo_tasks.dart';
import 'package:should_todo/features/tasks/add_tasks.dart';

import 'features/done_tasks/done_tasks.dart';
import 'features/settings/settings_screen.dart';

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

  Widget buildBody() {
    return AnimatedOpacity(
      opacity: selectedIndex == 0 ? 1.0 : 0.0,
      duration: const Duration(
        microseconds: 900,
      ),
      child: pages.elementAt(selectedIndex),
    );
  }

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
