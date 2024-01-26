
import 'dart:convert';
import 'package:hazloo_app/models/response/log_response.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;


class LogService {

 final Logger logger = Logger();
  String host = Constants.apiUrl;

  // * : Servicio para desabilitar la cuenta del usuario
  Future<LogResponse> logById(int id) async {
    var uri = Uri.https(
      host,
      'api/log/log-by-id/$id',
    );

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic
    );

    if (response.statusCode == 200) {
      return LogResponse.fromJson(json.decode(response.body));
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
  Future<List<LogResponse>> getLogByUser(int user) async {

    var uri =
        Uri.https(host, '/api/log/log-by-user/$user');

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic,
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<LogResponse> list = List<LogResponse>.from(
          l.map((model) => LogResponse.fromJson(model)));
      return list;
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