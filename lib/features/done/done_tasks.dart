import 'package:flutter/material.dart';
import 'package:should_todo/core/data/sqldb.dart';

import '../../core/widgets/mydrawer.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response =
        await sqlDb.selectData('SELECT * FROM todos WHERE done = 1');
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
              MaterialButton(
                onPressed: () async {
                  await sqlDb.myDeleteDatabase();
                },
                child: const Text('Delete Database'),
                color: Colors.red,
                textColor: Colors.white,
              ),
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
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
