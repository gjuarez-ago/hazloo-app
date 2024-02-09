import 'package:flutter/material.dart';
import 'package:hazloo_app/models/response/log_response.dart';

@immutable
abstract class LogState {
 
  final String? messageError;
  final LogResponse? response;
  final List<LogResponse>? listResponse;
  

  const LogState({
    this.messageError,
    this.response,
    this.listResponse
  });
}

class InitialLogState extends LogState {}

// Estados para traer el log de cambios
class IsLoadingLogList extends LogState {}

class ErrorLogList extends LogState {
  const ErrorLogList({required String messageError})
      : super(messageError: messageError);
}

class SuccessLogList extends LogState {
  const SuccessLogList({required List<LogResponse> listResponse})
      : super(listResponse: listResponse);
}


// Estados para traer el log por ID

class IsLoadingLogById extends LogState {}

class ErrorLogById  extends LogState {
  const ErrorLogById({required String messageError})
      : super(messageError: messageError);
}

class SuccessLogById  extends LogState {
  const SuccessLogById ({required LogResponse response})
      : super(response: response);
}