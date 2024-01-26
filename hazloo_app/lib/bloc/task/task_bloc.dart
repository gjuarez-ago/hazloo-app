import 'package:bloc/bloc.dart';
import 'package:hazloo_app/bloc/task/task_event.dart';
import 'package:hazloo_app/bloc/task/task_state.dart';
import 'package:hazloo_app/models/response/example_response.dart';
import 'package:hazloo_app/models/response/task_response.dart';
import 'package:hazloo_app/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(InitialTaskState());

  final _repository = TaskRepository();

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    // Ver detalle de un pago
    if (event is EventCreateTask) {
      yield IsLoadingCreateTask();

      try {
        TaskResponse response =
            await _repository.createTask(request: event.request!);

        yield SuccessCreateTask(response: response);
      } catch (e) {
        yield ErrorCreateTask(messageError: e.toString());
      }
    }


 if (event is EventUpdateTask) {
      yield IsLoadingUpdateTask();

      try {
        TaskResponse response =
            await _repository.updateTask(id: event.taskId!, request: event.request!);

        yield SuccessUpdateTask(response: response);
      } catch (e) {
        yield ErrorUpdateTask(messageError: e.toString());
      }
    }

    if (event is EventSolvedTask) {
      yield IsLoadingSolvedTask();

      try {
        TaskResponse response =
            await _repository.solvedTask(id: event.taskId!);

        yield SuccessSolvedTask(response: response);
      } catch (e) {
        yield ErrorSolvedTask(messageError: e.toString());
      }
    }


    if (event is EventGetTaskByParams) {
      yield IsLoadingListTask();

      try {
        List<ResponseExample> response =
            await _repository.getTaskByUser(request: event.userId!);

        yield SuccessListTask(response );
      } catch (e) {
        yield ErrorListTask(messageError: e.toString());
      }
    }

      if (event is EventGetTaskById) {
      yield IsLoadingTaskById();

      try {
        TaskResponse response =
            await _repository.getTaskById(id: event.taskId!);

        yield SuccessTaskById(response:response );
      } catch (e) {
        yield ErrorTaskById(messageError: e.toString());
      }
    }
  }
}
