import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String title,
    required String time,
    required String date,
    required String id,
    required bool isTodoCompleted,
  }) = _TaskModel;

  const TaskModel._();

  factory TaskModel.empty() => const TaskModel(
        date: '',
        time: '',
        id: "",
        title: "",
        isTodoCompleted: false,
      );

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
