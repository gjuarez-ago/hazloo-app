import 'package:bloc/bloc.dart';
import 'package:hazloo_app/bloc/log/log_event.dart';
import 'package:hazloo_app/bloc/log/log_state.dart';
import 'package:hazloo_app/models/response/log_response.dart';
import 'package:hazloo_app/repository/log_repository.dart';

class LogBloc extends Bloc<LogEvent, LogState> {
  LogBloc() : super(InitialLogState());

  final _repository = LogRespository();

  @override
  Stream<LogState> mapEventToState(LogEvent event) async* {
    // Ver detalle de un pago
    if (event is EventLogList) {
      yield IsLoadingLogList();

      try {
        List<LogResponse> response =
            await _repository.getLogByUser(user: event.userId!);

        yield SuccessLogList(listResponse: response);
      } catch (e) {
        yield ErrorLogList(messageError: e.toString());
      }
    }

    if (event is EventLogById) {
      yield IsLoadingLogById();

      try {
        LogResponse response = await _repository.logById(id: event.logId!);

        yield SuccessLogById(response: response);
      } catch (e) {
        yield ErrorLogById(messageError: e.toString());
      }
    }
  }
}
