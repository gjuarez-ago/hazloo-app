import 'package:flutter/material.dart';
import 'package:hazloo_app/models/response/task_response.dart';

@immutable
abstract class TaskState {
 
  final String? messageError;
  final TaskResponse? response;
  final List<TaskResponse>? listResponse;
  

  const TaskState({
    this.messageError,
    this.response,
    this.listResponse
  });
}

class InitialTaskState extends TaskState {}

// Estados para desactivar el perfil del usuario
class IsLoadingCreateTask extends TaskState {}

class ErrorCreateTask extends TaskState {
  const ErrorCreateTask({required String messageError})
      : super(messageError: messageError);
}

class SuccessCreateTask extends TaskState {
  const SuccessCreateTask({required TaskResponse response})
      : super(response: response);
}


// Estados para actualizar tarea
class IsLoadingUpdateTask extends TaskState {}

class ErrorUpdateTask extends TaskState {
  const ErrorUpdateTask({required String messageError})
      : super(messageError: messageError);
}

class SuccessUpdateTask extends TaskState {
  const SuccessUpdateTask({required TaskResponse response})
      : super(response: response);
}



// Estados para eliminar tarea
class IsLoadingDeleteTask extends TaskState {}

class ErrorDeleteteTask extends TaskState {
  const ErrorDeleteteTask({required String messageError})
      : super(messageError: messageError);
}

class SuccessDeleteTask extends TaskState {
  const SuccessDeleteTask({required TaskResponse response})
      : super(response: response);
}


// Estados para eliminar tarea
class IsLoadingListTask extends TaskState {}

class ErrorListTask extends TaskState {
  const ErrorListTask({required String messageError})
      : super(messageError: messageError);
}

class SuccessListTask extends TaskState {
  const SuccessListTask(List<TaskResponse> listResponse)
      : super(listResponse: listResponse);
}


// Estados para solucionar tarea
class IsLoadingSolvedTask extends TaskState {}

class ErrorSolvedTask extends TaskState {
  const ErrorSolvedTask({required String messageError})
      : super(messageError: messageError);
}

class SuccessSolvedTask extends TaskState {
  const SuccessSolvedTask({required TaskResponse response})
      : super(response: response);
}



// Estados para solucionar tarea
class IsLoadingTaskById extends TaskState {}

class ErrorTaskById extends TaskState {
  const ErrorTaskById({required String messageError})
      : super(messageError: messageError);
}

class SuccessTaskById extends TaskState {
  const SuccessTaskById({required TaskResponse response})
      : super(response: response);
}

