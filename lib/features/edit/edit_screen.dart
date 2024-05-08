import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:should_todo/core/data/sqldb.dart';

class EditTasks extends StatefulWidget {
  final String? todo;
  final String? time;
  final String? date;
  final int? id;

  const EditTasks({super.key, this.todo, this.time, this.date, this.id});

  @override
  State<EditTasks> createState() => _EditTasksState();
}

class _EditTasksState extends State<EditTasks> {
  final titleController = TextEditingController();

  final pickTimeController = TextEditingController();

  final pickDateController = TextEditingController();

  SqlDb sqlDb = SqlDb();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = widget.todo!;
    pickTimeController.text = widget.time!;
    pickDateController.text = widget.date!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Form(
                key: formKey,
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
                          'Edit your TODO',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              hintText: 'Enter your TODO Item'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Update your TODO';
                            }
                            return null;
                          },
                        ),
                        const Spacer(),
                        TextFormField(
                          controller: pickTimeController,
                          decoration:
                              const InputDecoration(hintText: 'Update Time'),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Update time';
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
                          decoration:
                              const InputDecoration(hintText: 'Update Date'),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Update Date';
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
                              int response = await sqlDb.updateData('''
                          UPDATE todos SET
                            todo = '${titleController.text}',
                            time = '${pickTimeController.text}',
                            date = '${pickDateController.text}' 
                            WHERE id = ${widget.id}
                            ''');
                              print('response ===================');
                              print(response);
                              if (response > 0 &&
                                  titleController.text.isNotEmpty &&
                                  pickTimeController.text.isNotEmpty &&
                                  pickDateController.text.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'TODO Updated Successfully',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.of(context).pop();
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'You have a Todo that you not updated yet',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          child: const Text('Update TODO'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
