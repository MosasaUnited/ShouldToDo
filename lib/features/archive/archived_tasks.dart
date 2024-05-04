import 'package:flutter/material.dart';

import '../../core/widgets/mydrawer.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Archived Tasks'),
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
        body: const Center(
          child: Text(
            'Archived Tasks',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
