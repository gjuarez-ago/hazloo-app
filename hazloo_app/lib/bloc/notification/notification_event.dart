import 'package:flutter/material.dart';

@immutable
abstract class NotificationEvent {
  final int? id;
  final int? userId;

  const NotificationEvent({this.id, this.userId});
}

// Evento para desactivar el perfil del usuario
class EventNotificationList extends NotificationEvent {
  const EventNotificationList({required int userId}) : super(userId: userId);
}

// Evento para buscar un usuario por ID
class EventNotificatioById extends NotificationEvent {
  const EventNotificatioById({required int id}) : super(id: id);
}
