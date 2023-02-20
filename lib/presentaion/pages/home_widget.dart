import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/presentaion/pages/widgets/todo_action_part.dart';
import 'package:todo_app/presentaion/pages/widgets/todos_part.dart';
import 'package:todo_app/providers/todo_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList =
        ref.watch(todoNotifierProvider.select((state) => state.todoList));
    final reversedTodoList = List<TaskModel>.from(todoList.reversed);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Riverpod StateNotifier',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TodosActionPart(),
              TodosPart(todoList: reversedTodoList),
            ],
          ),
        ),
      ),
    );
  }
}
