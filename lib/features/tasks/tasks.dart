import 'package:flutter/material.dart';
import 'package:should_todo/core/widgets/mydrawer.dart';

import 'ui/screens/todo_screen.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool showTodoScreen = false;

  void toggleTodoScreen() {
    setState(() {
      showTodoScreen = !showTodoScreen;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Add New Task'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ],
      ),
      drawer: const MyDrawer(),
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
      body: Center(
        child: showTodoScreen
            ? const TodoScreen()
            : RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'To Add a New Task Please Press the ',
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '+ ',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  TextSpan(
                    text: '\nButton',
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
      ),
    );
  }
}
