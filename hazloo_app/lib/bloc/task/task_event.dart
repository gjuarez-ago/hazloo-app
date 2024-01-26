import 'package:flutter/material.dart';
import 'package:hazloo_app/models/params/task_get_params.dart';
import 'package:hazloo_app/models/params/task_params.dart';

@immutable
abstract class TaskEvent {

   final int? taskId;
   final TaskParams? request;
   final TaskGetParams? params;
   final int? userId;


  const TaskEvent(
      {this.taskId, this.params, this.request, this.userId});
}

// Evento para desactivar el perfil del usuario
class EventCreateTask extends TaskEvent {
  const EventCreateTask({required TaskParams request})
      : super(request: request);
}

// Evento para buscar un usuario por ID
class EventUpdateTask extends TaskEvent {
  const EventUpdateTask({required int taskId, required, required TaskParams request}) : super(taskId: taskId, request: request );
}

// Evento para restablecer la contraseña dentro de la app
class EventGetTaskByParams extends TaskEvent {
  const EventGetTaskByParams({required int userId })
      : super(userId: userId);
}

// Evento para restablecer la contraseña dentro de la app
class EventGetTaskById extends TaskEvent {
  const EventGetTaskById({required int taskId })
      : super(taskId: taskId);
}

// Evento para restablecer la contraseña dentro de la app
class EventDeleteTaskById extends TaskEvent {
  const EventDeleteTaskById({required int taskId })
      : super(taskId: taskId);
}

// Evento para restablecer la contraseña dentro de la app
class EventSolvedTask extends TaskEvent {
  const EventSolvedTask({required int taskId })
      : super(taskId: taskId);
}




