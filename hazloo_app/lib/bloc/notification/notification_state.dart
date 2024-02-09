import 'package:flutter/material.dart';
import 'package:hazloo_app/models/response/notification_response.dart';

@immutable
abstract class NotificationState {
 
  final String? messageError;
  final NotificationResponse? response;
  final List<NotificationResponse>? listResponse;
  

  const NotificationState({
    this.messageError,
    this.response,
    this.listResponse
  });

}

class InitialNotificationState extends NotificationState {}

// Estados para traer el log de cambios
class IsLoadingNotificationList extends NotificationState {}

class ErrorNotificationList extends NotificationState {
  const ErrorNotificationList({required String messageError})
      : super(messageError: messageError);
}

class SuccessNotificationList extends NotificationState {
  const SuccessNotificationList({required List<NotificationResponse> listResponse})
      : super(listResponse: listResponse);
}


// Estados para traer el log por ID

class IsLoadingNotificationById extends NotificationState {}

class ErrorNotificationById  extends NotificationState {
  const ErrorNotificationById({required String messageError})
      : super(messageError: messageError);
}

class SuccessNotificationById  extends NotificationState {
  const SuccessNotificationById ({required NotificationResponse response})
      : super(response: response);
}