import 'dart:convert';
import 'package:hazloo_app/models/params/user_register_params.dart';
import 'package:hazloo_app/models/response/http_response.dart';
import 'package:hazloo_app/models/response/login_response.dart';
import 'package:hazloo_app/models/response/user_response.dart';
import 'package:hazloo_app/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class AuthService {
  
  final Logger logger = Logger();
  String host = Constants.apiUrl;

  // ** : Servicio para loguearnos
  Future<LoginResponse> login(String user, String password) async {
    var uri = Uri.http(
      host,
      '/api/auth/signin',
    );

    final http.Response response = await http.post(
      uri,
      headers: Constants.headersPublic,
      body:
          jsonEncode(<String, dynamic>{"username": user, "password": password}),
    );

    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Nombre de usuario / contraseña incorrectos. Inténtalo de nuevo");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  // ** : Servicio para registrarnos
  Future<UserResponse> register(UserRegisterParams params) async {
    var uri = Uri.http(
      host,
      '/hazloo/api/auth/register',
    );

    final http.Response response = await http.post(
      uri,
      headers: Constants.headersPublic,
      body: jsonEncode(<String, dynamic>{
        "username": params.username,
        "password": params.email,
        "email": params.password
      }),
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Nombre de usuario / contraseña incorrectos. Inténtalo de nuevo");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  // ** Servicio para recuperar la contraseña
  Future<HttpResponse> recoveryPassword(String email) async {
    var uri = Uri.http(
      host,
      '/hazloo/api/auth/recovery/$email',
    );

    final http.Response response = await http.get(
      uri,
      headers: Constants.headersPublic,
    );

    if (response.statusCode == 200) {
      return HttpResponse.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 400) {
      return throw ("Ocurrio un error con la consulta");
    }

    if (response.statusCode == 500) {
      return throw ("Problemas en el servidor");
    }

    return throw ("No funciona el servicio por el momento");
  }

  // ** : Verificar correo de usuario
  Future<UserResponse> resetPassword(String username, String code) async {
    var uri = Uri.http(
      host,
      '/hazloo/api/auth/reset-password',
    );

    final http.Response response = await http.post(
      uri,
      headers: Constants.headersPublic,
      body: jsonEncode(<String, dynamic>{"username": code}),
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
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
