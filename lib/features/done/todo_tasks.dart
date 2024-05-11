import 'package:flutter/material.dart';
import 'package:should_todo/core/data/sqldb.dart';

import 'ui/screens/edit_screen.dart';

class ToDoTasks extends StatefulWidget {
  const ToDoTasks({super.key});

  @override
  State<ToDoTasks> createState() => _ToDoTasksState();
}

class _ToDoTasksState extends State<ToDoTasks> {
  SqlDb sqlDb = SqlDb();

  List todos = [];

  bool isLoading = true;

  bool? isChecked = false;

  Future readData() async {
    List<Map> response = await sqlDb.selectData('SELECT * FROM todos');
    todos.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    ListView.builder(
                      itemCount: todos.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            title: Text(todos[i]['todo']),
                            subtitle: Text(todos[i]['time']),
                            leading: Text(todos[i]['date']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: todos[i]['completed'] == 1
                                      ? true
                                      : false, // Set checkbox value based on 'completed' field
                                  onChanged: (bool? value) {
                                    // Create a copy of the current to do item
                                    final updatedTodo =
                                        Map<String, dynamic>.from(todos[i]);
                                    // Handle checkbox change
                                    setState(() {
                                      updatedTodo['completed'] = value!
                                          ? 1
                                          : 0; // Update 'completed' in the copy
                                      todos[i] =
                                          updatedTodo; // Replace the original item with the updated copy

                                      // Update database with the changed value (implementation depends on your sqflite usage)
                                      sqlDb.updateData(
                                          "UPDATE todos SET completed = ${updatedTodo['completed']} WHERE id = ${updatedTodo['id']}");
                                    });
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EditTasks(
                                          todo: todos[i]['todo'],
                                          time: todos[i]['time'],
                                          date: todos[i]['date'],
                                          id: todos[i]['id'],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                // IconButton(
                                //   onPressed: () async {
                                //     int response = await sqlDb.deleteData(
                                //         "DELETE FROM todos WHERE id = ${todos[i]['id']}");
                                //     if (response > 0) {
                                //       todos.removeWhere((element) =>
                                //           element['id'] == todos[i]['id']);
                                //       setState(() {});
                                //     }
                                //   },
                                //   icon: const Icon(
                                //     Icons.delete,
                                //     color: Colors.redAccent,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],

                  // delete all database ( not recommended )
                  // MaterialButton(
                  //   onPressed: () async {
                  //     await sqlDb.myDeleteDatabase();
                  //   },
                  //   color: Colors.red,
                  //   textColor: Colors.white,
                  //   child: const Text('Delete All Database'),
                  // ),
                ),
              ),
      ),
    );
  }
}
