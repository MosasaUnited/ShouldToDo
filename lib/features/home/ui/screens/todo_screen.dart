import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final pickTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.h,
        height: 300.h,
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
              TextField(
                controller: pickTimeController,
                decoration: const InputDecoration(hintText: 'Pick Time'),
                onTap: () async {
                  //await the Future returned by showTimePicker
                  final selectTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectTime != null) {
                    print(selectTime);
                    final formattedTime = selectTime.format(context);
                    pickTimeController.text = formattedTime;
                  }
                },
              ),
              SizedBox(
                height: 50.h,
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
