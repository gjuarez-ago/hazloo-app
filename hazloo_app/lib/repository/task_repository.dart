import 'package:hazloo_app/models/params/task_get_params.dart';
import 'package:hazloo_app/models/params/task_params.dart';
import 'package:hazloo_app/models/response/task_response.dart';
import 'package:hazloo_app/services/task_service.dart';

import '../models/response/example_response.dart';

class TaskRepository {
 
  TaskService service = TaskService();

  Future<TaskResponse> deleteTaskById({required int id}) =>
      service.deleteTaskById(id);

  Future<TaskResponse> solvedTask({required int id}) =>
      service.solvedTask(id);

  Future<TaskResponse> getTaskById({required int id}) =>
      service.getTaskById(id);

  Future<List<ResponseExample>> getTaskByUser(
          {required int request}) =>
      service.getTaskByUser(request);

  Future<TaskResponse> updateTask(
          {required int id, required TaskParams request}) =>
      service.updateTask(id, request);

  Future<TaskResponse> createTask({required TaskParams request}) =>
      service.createTask(request);
}
