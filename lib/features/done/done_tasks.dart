import 'package:flutter/material.dart';

import '../../core/widgets/mydrawer.dart';

class DoneTasks extends StatelessWidget {
  const DoneTasks({super.key});

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
        body: const Center(
          child: Text(
            'Done Tasks',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
