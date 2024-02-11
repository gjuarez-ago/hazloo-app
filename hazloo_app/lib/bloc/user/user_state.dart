import 'package:flutter/material.dart';
import 'package:hazloo_app/models/response/user_response.dart';

@immutable
abstract class UserState {
 
  final String? messageError;
  final UserResponse? response;

  const UserState({
    this.messageError,
    this.response
  });
}

class InitialUserState extends UserState {}

// Estados para desactivar el perfil del usuario
class IsLoadingDesactivateProfile extends UserState {}

class ErrorDesactivateProfile extends UserState {
  const ErrorDesactivateProfile({required String messageError})
      : super(messageError: messageError);
}

class SuccessDesactivateProfile extends UserState {
  const SuccessDesactivateProfile({required UserResponse response})
      : super(response: response);
}

// Estados para buscar información del usuario por username
class IsLoadingGetUsername extends UserState {}

class ErrorGetUsername extends UserState {
  const ErrorGetUsername({required String messageError})
      : super(messageError: messageError);
}

class SuccessGetUsername extends UserState {
  const SuccessGetUsername({required UserResponse response})
      : super(response: response);
}

// Estados para actualizar el perfil del usuario
class IsLoadingUpdateProfile extends UserState {}

class ErrorUpdateProfile extends UserState {
  const ErrorUpdateProfile({required String messageError})
      : super(messageError: messageError);
}

class SuccessUpdateProfile extends UserState {
  const SuccessUpdateProfile({required UserResponse response})
      : super(response: response);
}

// Estados para restablecer la contraseña dentro del sistema
class IsLoadingResetPassword extends UserState {}

class ErrorResetPassword extends UserState {
  const ErrorResetPassword({required String messageError})
      : super(messageError: messageError);
}

class SuccessResetPassword extends UserState {
  const SuccessResetPassword({required UserResponse response})
      : super(response: response);
}

