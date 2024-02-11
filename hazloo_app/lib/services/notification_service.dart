import 'dart:convert';
import 'package:hazloo_app/models/response/log_response.dart';
import 'package:hazloo_app/models/response/notification_response.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  final Logger logger = Logger();
  String host = Constants.apiUrl;

  // * : Servicio para desabilitar la cuenta del usuario
  Future<NotificationResponse> getNotificationById(int id) async {
    var uri = Uri.http(
      host,
      'api/notification/notifications-by-user/$id',
    );

    final http.Response response =
        await http.get(uri, headers: Constants.headersPublic);

    if (response.statusCode == 200) {
      return NotificationResponse.fromJson(json.decode(response.body));
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
  Future<List<NotificationResponse>> getNotificationsByUser(int user) async {
   
    var uri = Uri.http(host, 'api/notification/ads-by-user-nr/$user');

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic,
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<NotificationResponse> list =
          List<NotificationResponse>.from(l.map((model) => LogResponse.fromJson(model)));
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
