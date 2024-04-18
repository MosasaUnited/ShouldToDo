import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final pickTimeController = TextEditingController();
  final pickDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.h,
        height: 350.h,
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
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter your TODO Item'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Spacer(),
              TextField(
                controller: pickTimeController,
                decoration: const InputDecoration(hintText: 'Pick Time'),
                readOnly: true,
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
              const Spacer(),
              TextField(
                controller: pickDateController,
                decoration: const InputDecoration(hintText: 'Pick Date'),
                readOnly: true,
                onTap: () async {
                  //await the Future returned by showTimePicker
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2028-01-01'),
                  ).then((value) {
                    pickDateController.text = DateFormat.yMMMd().format(value!);
                    print(value.toString());
                  });
                  if (selectDate != null) {}
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
