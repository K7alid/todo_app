import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/model/task_model.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    required List<TaskModel> todoList,
    required TaskModel todo,
  }) = _TodoState;

  const TodoState._();

  factory TodoState.empty() => TodoState(
        todoList: [],
        todo: TaskModel.empty(),
      );
}
