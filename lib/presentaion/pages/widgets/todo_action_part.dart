import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/application/todo_event.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodosActionPart extends ConsumerWidget {
  TodosActionPart({
    Key? key,
  }) : super(key: key);
  var formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 70.w,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title musn\'t not be empty';
                }
                return null;
              },
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: 20),
              ),
              autocorrect: false,
            ),
          ),
          SizedBox(
            width: 70.w,
            child: TextFormField(
              controller: timeController,
              decoration: const InputDecoration(
                labelText: 'Time',
                labelStyle: TextStyle(fontSize: 20),
              ),
              autocorrect: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Time musn\'t not be empty';
                }
                return null;
              },
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  timeController.text = value!.format(context).toString();
                });
              },
            ),
          ),
          SizedBox(
            width: 70.w,
            child: TextFormField(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(
                      days: 100,
                    ),
                  ),
                ).then((value) {
                  dateController.text = DateFormat.yMMMd().format(value!);
                });
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Date musn\'t not be empty';
                }
                return null;
              },
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Date',
                labelStyle: TextStyle(fontSize: 20),
              ),
              autocorrect: false,
            ),
          ),
          IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ref.read(todoNotifierProvider.notifier).mapEventsToStates(
                      TodoTitleChanged(
                        title: titleController.value.text,
                        date: dateController.value.text,
                        time: timeController.text,
                      ),
                    );
                ref.read(todoNotifierProvider.notifier).mapEventsToStates(
                      const AddTodo(),
                    );
                titleController.clear();
                dateController.clear();
                timeController.clear();
              }
            },
            icon: const Icon(
              Icons.add,
              color: Colors.indigo,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
