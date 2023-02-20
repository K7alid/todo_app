import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/application/todo_event.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodosPart extends ConsumerWidget {
  const TodosPart({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  final List<TaskModel> todoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return todoList.isEmpty
        ? const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              "There is no To do",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            width: 100.w,
            height: 100.h,
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 100.w,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        value: todoList[index].isTodoCompleted,
                        onChanged: (isTodoCompleted) {
                          ref
                              .read(todoNotifierProvider.notifier)
                              .mapEventsToStates(
                                TodoStatusChanged(todoId: todoList[index].id),
                              );
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            todoList[index].title,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            todoList[index].time,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            todoList[index].date,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(todoNotifierProvider.notifier)
                              .mapEventsToStates(
                                RemoveTodo(
                                  todoId: todoList[index].id,
                                ),
                              );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
