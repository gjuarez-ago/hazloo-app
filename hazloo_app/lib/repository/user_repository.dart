import 'package:hazloo_app/models/response/user_response.dart';
import 'package:hazloo_app/services/user_service.dart';

class UserRepository {
  UserService service = UserService();


  Future<UserResponse> getInformationUser({required String username}) =>
      service.getInformationUser(username);

  Future<UserResponse> updateProfile({dynamic params}) =>
      service.updateProfile(params);

  Future<UserResponse> resetPasswordInside(
          {required String username, required String password}) =>
      service.resetPasswordInside(username, password);
}
