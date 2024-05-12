import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:should_todo/core/theming/lottie_assets.dart';

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
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'To Add a New Task Please \n Press the \n',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          color: Colors.black87,
                        ),
                      ),
                      Lottie.asset(
                        AppLottieAssets.floatingActionButtonAnimated,
                        height: 200.h,
                        width: 250.w,
                      ),
                      Text(
                        '\nButton',
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.aBeeZee().fontFamily,
                          color: Colors.black87,
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
