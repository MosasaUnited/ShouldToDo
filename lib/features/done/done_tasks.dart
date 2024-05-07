import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:should_todo/core/data/sqldb.dart';
import 'package:should_todo/core/routing/app_router.dart';

import '../../core/widgets/mydrawer.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.selectData('SELECT * FROM todos');
    return response;
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
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              FutureBuilder(
                future: readData(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data![i]['todo']),
                            subtitle: Text(snapshot.data![i]['time']),
                            leading: Text(snapshot.data![i]['date']),
                            trailing: IconButton(
                              onPressed: () async {
                                int response = await sqlDb.deleteData(
                                    "DELETE FROM todos WHERE id = ${snapshot.data![i]['id']}");
                                if (response > 0) {
                                  GoRouter.of(context)
                                      .push(AppRouter.kDoneTasks);
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      value: 0.6,
                      color: Colors.amber,
                      strokeWidth: 5,
                    ),
                  );
                },
              ),

              // delete all database ( not recommended )
              // MaterialButton(
              //   onPressed: () async {
              //     await sqlDb.myDeleteDatabase();
              //   },
              //   color: Colors.red,
              //   textColor: Colors.white,
              //   child: const Text('Delete All Database'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
