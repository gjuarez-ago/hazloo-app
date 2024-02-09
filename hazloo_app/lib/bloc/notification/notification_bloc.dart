import 'package:bloc/bloc.dart';
import 'package:hazloo_app/bloc/notification/notification_event.dart';
import 'package:hazloo_app/bloc/notification/notification_state.dart';
import 'package:hazloo_app/models/response/notification_response.dart';
import 'package:hazloo_app/repository/notification_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(InitialNotificationState());

  final _repository = NotificationRespository();

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    // Ver detalle de un pago
    if (event is EventNotificationList) {
      yield IsLoadingNotificationList();

      try {
        List<NotificationResponse> response =
            await _repository.getNotificationsByUser(user: event.userId!);

        yield SuccessNotificationList(listResponse: response);
      } catch (e) {
        yield ErrorNotificationList(messageError: e.toString());
      }
    }

    if (event is EventNotificatioById) {
      yield IsLoadingNotificationById();

      try {
        NotificationResponse response =
            await _repository.getNotificationById(id: event.id!);

        yield SuccessNotificationById(response: response);
      } catch (e) {
        yield ErrorNotificationById(messageError: e.toString());
      }
    }
  }
}
