import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.h,
        height: 250.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          shape: BoxShape.rectangle,
          color: Colors.blueGrey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Add a New TODO',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Enter your TODO Item'),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    //   TODO: Implement functionality to add the todo item
                  },
                  child: const Text('Add TODO'))
            ],
          ),
        ),
      ),
    );
  }
}
