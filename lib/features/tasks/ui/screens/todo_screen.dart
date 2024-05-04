import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:should_todo/core/data/sqldb.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleController = TextEditingController();

  final pickTimeController = TextEditingController();

  final pickDateController = TextEditingController();

  SqlDb sqlDb = SqlDb();

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
                controller: titleController,
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
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2028-01-01'),
                  ).then((value) {
                    pickDateController.text = DateFormat.yMMMd().format(value!);
                  });
                  if (selectDate != null) {}
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  int response = await sqlDb.insertData(
                    "INERT INTO todo (title, date, time) VALUES ('${titleController.text}', '${pickDateController.text}', '${pickTimeController.text}')",
                  );
                  print(response);
                },
                child: const Text('Add TODO'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
