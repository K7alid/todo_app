// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      title: json['title'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      id: json['id'] as String,
      isTodoCompleted: json['isTodoCompleted'] as bool,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'time': instance.time,
      'date': instance.date,
      'id': instance.id,
      'isTodoCompleted': instance.isTodoCompleted,
    };
