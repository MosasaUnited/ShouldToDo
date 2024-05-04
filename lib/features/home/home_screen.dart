import 'package:flutter/material.dart';

import 'ui/widgets/mydrawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Icon menuIcon = const Icon(Icons.menu);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            'ShouldToDo',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: const Text('to Add New Tasks please Open the Menu '),
      ),
    );
  }
}
