import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/screens/todo_screen.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: showTodoScreen
              ? const TodoScreen()
              : RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'To Add a New Task Please Press the \n',
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '+ ',
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.w900,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          color: Colors.yellowAccent,
                        ),
                      ),
                      TextSpan(
                        text: '\nButton',
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
