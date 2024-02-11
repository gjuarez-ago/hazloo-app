import 'package:flutter/material.dart';

@immutable
abstract class UserEvent {
  final String? username;
  final bool? status;
  final String? password;
  final dynamic profileParams;

  const UserEvent(
      {this.username, this.status, this.password, this.profileParams});
}


// Evento para buscar un usuario por ID
class EventGetUser extends UserEvent {
  const EventGetUser({required String username}) : super(username: username);
}

// Evento para generar una referencia de pago.
class EventUpdateProfile extends UserEvent {
  const EventUpdateProfile({required dynamic profileParams})
      : super(profileParams: profileParams);
}


class EventResetPasword extends UserEvent {
  const EventResetPasword({required dynamic profileParams})
      : super(profileParams: profileParams);
}

