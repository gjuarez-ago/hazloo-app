import 'package:bloc/bloc.dart';
import 'package:hazloo_app/bloc/auth/recovery_password/recovery_password_event.dart';
import 'package:hazloo_app/bloc/auth/recovery_password/recovery_password_state.dart';
import 'package:hazloo_app/models/response/http_response.dart';
import 'package:hazloo_app/repository/auth_repository.dart';

class RecoveryPasswordBloc
    extends Bloc<RecoveryPasswordEvent, RecoveryPasswordState> {
  RecoveryPasswordBloc() : super(InitialRPSState());

  final _repositoryAuth = AuthRepository();

  @override
  Stream<RecoveryPasswordState> mapEventToState(
      RecoveryPasswordEvent event) async* {
    yield IsLoadingRPS();

    if (event is EventRPS) {
      yield IsLoadingRPS();
      try {
        HttpResponse response =
            await _repositoryAuth.recoveryPassword(username: event.username);

        yield SuccessRPS(response: response);
      } catch (e) {
        yield ErrorRPS(errorMessage: e.toString());
      }
    }
  }
}
