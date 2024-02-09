import 'package:hazloo_app/models/response/log_response.dart';
import 'package:hazloo_app/models/response/notification_response.dart';
import 'package:hazloo_app/services/log_service.dart';
import 'package:hazloo_app/services/notification_service.dart';

class NotificationRespository {
  
  NotificationService service = NotificationService();

  Future<List<NotificationResponse>> getNotificationsByUser({required int user}) =>
      service.getNotificationsByUser(user);

  Future<NotificationResponse> getNotificationById({required int id}) => service.getNotificationById(id);
}
