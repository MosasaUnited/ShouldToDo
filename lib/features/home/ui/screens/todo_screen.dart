import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Add a New TODO',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Enter your TODO Item'),
            ),
            ElevatedButton(
                onPressed: () {
                  //   TODO: Implement functionality to add the todo item
                  // Navigator.pop(context);
                },
                child: const Text('Add TODO'))
          ],
        ),
      ),
    );
  }
}
