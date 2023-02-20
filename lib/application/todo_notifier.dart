import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/application/todo_event.dart';
import 'package:todo_app/application/todo_state.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:uuid/uuid.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(TodoState.empty());

  final uuid = const Uuid();

  mapEventsToStates(TodoEvent event) async {
    return event.map(
      todoTitleChanged: (todoTitleChangedEvent) {
        state = state.copyWith(
          todo: TaskModel(
            id: state.todo.id,
            time: todoTitleChangedEvent.time.trimLeft(),
            date: todoTitleChangedEvent.date.trimLeft(),
            title: todoTitleChangedEvent.title.trimLeft(),
            isTodoCompleted: false,
          ),
        );
      },
      todoStatusChanged: (todoStatusChangedEvent) {
        final selectedTodo = state.todoList
            .where((element) => element.id == todoStatusChangedEvent.todoId)
            .single;
        final todolist = [...state.todoList];

        todolist[todolist
                .indexWhere((element) => element.id == selectedTodo.id)] =
            TaskModel(
                time: selectedTodo.time,
                date: selectedTodo.date,
                id: selectedTodo.id,
                title: selectedTodo.title,
                isTodoCompleted: !selectedTodo.isTodoCompleted);

        state = state.copyWith(todoList: todolist);
      },
      addTodo: (addTodoEvent) {
        final List<TaskModel> todoList = [...state.todoList];
        todoList.add(
          TaskModel(
            time: state.todo.time,
            date: state.todo.date,
            id: uuid.v1(),
            title: state.todo.title,
            isTodoCompleted: false,
          ),
        );
        state = state.copyWith(todoList: todoList);
      },
      removeTodo: (removeTodoEvent) {
        final List<TaskModel> todoList = [...state.todoList];
        final todoId = removeTodoEvent.todoId;

        todoList.removeWhere((element) => element.id == todoId);

        state = state.copyWith(todoList: todoList);
      },
    );
  }
}
