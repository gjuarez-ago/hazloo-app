import 'package:hazloo_app/models/response/log_response.dart';
import 'package:hazloo_app/services/log_service.dart';

class LogRespository {
  
  LogService service = LogService();

  Future<List<LogResponse>> getLogByUser({required int user}) =>
      service.getLogByUser(user);

  Future<LogResponse> logById({required int id}) => service.logById(id);
}
