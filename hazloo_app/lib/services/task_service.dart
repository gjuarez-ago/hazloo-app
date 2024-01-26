import 'dart:convert';
import 'dart:developer';
import 'package:hazloo_app/models/params/task_params.dart';
import 'package:hazloo_app/models/response/example_response.dart';
import 'package:hazloo_app/models/response/task_response.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class TaskService {
  final Logger logger = Logger();
  String host = Constants.apiUrl;

  // * : Servicio para desabilitar la cuenta del usuario
  Future<TaskResponse> createTask(TaskParams request) async {
    var uri = Uri.http(
      host,
      'api/task/create-task',
    );

    final http.Response response = await http.post(
      uri,
      headers: Constants.headersPublic,
      body: jsonEncode(<String, dynamic>{
        "category": request.category,
        "description": request.description,
        "labels": request.labels,
        "prioridad": request.prioridad,
        "title": request.title,
        "userId": request.user
      }),
    );

    if (response.statusCode == 200) {
      return TaskResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  // * : Buscar información del usuario por username
  Future<TaskResponse> deleteTaskById(int id) async {
    var uri = Uri.http(
      host,
      '/api/task/delete-task/$id',
    );

    final http.Response response = await http.delete(
      uri,
      headers: Constants.headersPublic,
    );

    if (response.statusCode == 200) {
      return TaskResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  // * : Buscar información del usuario por username
  Future<List<ResponseExample>> getTaskByUser(int userId) async {
    
    final queryParameters = {
      'user': userId
    };

    var uri = Uri.http(host, '/category/list');

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic,
    );

          log(response.body);


    if (response.statusCode == 200) {

      //     Iterable l = json.decode(response.body);

      // Iterable list = json.decode(response.body);
      //    List<TaskResponse>     posts = list.map((model) => TaskResponse.fromJson(model)).toList();

      List<dynamic> body = jsonDecode(response.body);

      List<ResponseExample> posts = body
          .map(
            (dynamic item) => ResponseExample.fromJson(item),
          )
          .toList();

      return posts;
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  Future<TaskResponse> getTaskById(int id) async {
    var uri = Uri.http(
      host,
      '/api/task/get-task-by-id/$id',
    );

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic,
    );

    if (response.statusCode == 200) {
      return TaskResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  Future<TaskResponse> updateTask(int id, TaskParams request) async {
    var uri = Uri.http(host, '/api/task/update-task/$id');

    final http.Response response = await http.post(
      uri,
      headers: Constants.headersPublic,
      body: jsonEncode(<String, dynamic>{
        "category": request.category,
        "description": request.description,
        "labels": request.labels,
        "prioridad": request.prioridad,
        "title": request.title
      }),
    );

    if (response.statusCode == 200) {
      return TaskResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  Future<TaskResponse> solvedTask(int id) async {
    var uri = Uri.http(host, '/api/task/update-task/$id');

    final http.Response response =
        await http.post(uri, headers: Constants.headersPublic);

    if (response.statusCode == 200) {
      return TaskResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }
}
