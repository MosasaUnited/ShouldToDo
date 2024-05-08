import 'package:flutter/material.dart';
import 'package:should_todo/core/data/sqldb.dart';

import '../../core/widgets/mydrawer.dart';
import '../edit/edit_screen.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  SqlDb sqlDb = SqlDb();

  List todos = [];

  bool isLoading = true;

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
        appBar: AppBar(
          title: const Text('Done Tasks'),
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
                                IconButton(
                                  onPressed: () async {
                                    int response = await sqlDb.deleteData(
                                        "DELETE FROM todos WHERE id = ${todos[i]['id']}");
                                    if (response > 0) {
                                      todos.removeWhere((element) =>
                                          element['id'] == todos[i]['id']);
                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                ),
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
