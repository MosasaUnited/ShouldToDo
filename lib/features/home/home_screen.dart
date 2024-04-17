import 'package:flutter/material.dart';
import 'package:should_todo/features/home/ui/screens/archived_tasks.dart';
import 'package:should_todo/features/home/ui/screens/done_tasks.dart';
import 'package:should_todo/features/home/ui/screens/tasks.dart';
import 'package:should_todo/features/home/ui/screens/todo_screen.dart';
import 'package:sqflite/sqflite.dart';

import 'ui/widgets/mydrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int currentIndex = 0;

  List<Widget> screens = [
    const Tasks(),
    const DoneTasks(),
    const ArchivedTasks()
  ];

  List<String> titles = ['Tasks', 'Done', 'Archived'];

  Database? database;

  bool showTodoScreen = false;

  void toggleTodoScreen() {
    setState(() {
      showTodoScreen = !showTodoScreen;
    });
  }

  @override
  void initState() {
    super.initState();

    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleTodoScreen();
        },
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: showTodoScreen ? const Icon(Icons.close) : const Icon(Icons.add),
      ),
      // body: Center(
      //   child: showTodoScreen
      //       ? const TodoScreen()
      //       : const Text(
      //           'Add a New TODO',
      //           style: TextStyle(
      //             fontSize: 30,
      //           ),
      //         ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archived'),
        ],
      ),
      body: showTodoScreen ? TodoScreen() : screens[currentIndex],
    );
  }

  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
      print('database created');
      await database.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
    }, onOpen: (database) {
      print('database opened');
    });
  }

  void insertToDatabase() {
    database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES("First Task", "258745", "12:00", "Active")')
          .then((value) {
        print('inserted Successfully');
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }
}
