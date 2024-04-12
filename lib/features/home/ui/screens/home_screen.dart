import 'package:flutter/material.dart';

import '../widgets/mydrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Should ToDo'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
