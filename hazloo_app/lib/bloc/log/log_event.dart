
import 'package:flutter/material.dart';

@immutable
abstract class LogEvent {

   final int? logId;
   final int? userId;

  const LogEvent({this.logId, this.userId});

}

// Evento para desactivar el perfil del usuario
class EventLogList extends LogEvent {
  const EventLogList({required int userId})
      : super(userId: userId);
}

// Evento para buscar un usuario por ID
class EventLogById extends LogEvent {
  const EventLogById({required int logId }) : super(logId: logId );
}
