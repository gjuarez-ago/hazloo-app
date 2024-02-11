
import 'package:hazloo_app/models/params/user_register_params.dart';
import 'package:hazloo_app/models/response/http_response.dart';
import 'package:hazloo_app/models/response/login_response.dart';
import 'package:hazloo_app/models/response/user_response.dart';
import 'package:hazloo_app/services/auth_service.dart';

class AuthRepository {
  AuthService service = AuthService();


  Future<LoginResponse> login(
          {required String user, required String password}) =>
      service.login(user, password);
      
  Future<UserResponse> register({required UserRegisterParams params}) =>
      service.register(params);

  Future<HttpResponse> recoveryPassword({required String username}) =>
      service.recoveryPassword(username);

}
