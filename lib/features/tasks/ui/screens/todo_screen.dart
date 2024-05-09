import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:should_todo/core/data/sqldb.dart';

import '../../../../core/routing/app_router.dart';

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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Container(
          width: 400.h,
          height: 450.h,
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
                      return 'Please enter your TODO';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: pickTimeController,
                  decoration: const InputDecoration(hintText: 'Pick Time'),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose time';
                    }
                    return null;
                  },
                  onTap: () async {
                    final selectTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectTime != null) {
                      print(selectTime);
                      final formattedTime = selectTime.format(context);
                      pickTimeController.text = formattedTime;
                    } else {
                      print('Time not selected');
                    }
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: pickDateController,
                  decoration: const InputDecoration(hintText: 'Pick Date'),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose date';
                    }
                    return null;
                  },
                  onTap: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2038-01-01'),
                    ).then((value) {
                      pickDateController.text =
                          DateFormat.yMMMd().format(value!);
                    });
                    if (selectDate != null) {
                      print(selectDate);
                      final formattedDate = selectDate.format(context);
                      pickDateController.text = formattedDate;
                    } else {
                      print('Date not selected');
                    }
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      int response = await sqlDb.insertData(
                        "INSERT INTO todos (todo, time, date) VALUES ('${titleController.text}', '${pickTimeController.text}', '${pickDateController.text}')",
                      );
                      print('response ===================');
                      print(response);
                      if (response > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'TODO Added Successfully',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        GoRouter.of(context).push(AppRouter.kDoneTasks);
                        setState(() {});
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'You have a Todo that you must finish',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: const Text('Add TODO'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
