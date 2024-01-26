import 'package:bloc/bloc.dart';
import 'package:hazloo_app/bloc/auth/register/register_event.dart';
import 'package:hazloo_app/bloc/auth/register/register_state.dart';
import 'package:hazloo_app/models/response/user_response.dart';
import 'package:hazloo_app/repository/auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(InitialRegisterState());

  final _repositoryAuth = AuthRepository();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield IsLoadingRegister();

    if (event is EventRegister) {
      yield IsLoadingRegister();
      try {
        UserResponse response =
            await _repositoryAuth.register(params: event.params);

        yield SuccessRegister(response: response);
      } catch (e) {
        yield ErrorRegister(errorMessage: e.toString());
      }
    }
  }
}
