import 'package:bloc/bloc.dart';
import 'package:hazloo_app/bloc/user/user_event.dart';
import 'package:hazloo_app/bloc/user/user_state.dart';
import 'package:hazloo_app/models/response/user_response.dart';
import 'package:hazloo_app/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState());

  final _repository = UserRepository();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // Ver detalle de un pago
   

    // Conseguir información del usuario
    if (event is EventGetUser) {
      yield IsLoadingGetUsername();

      try {
        UserResponse response =
            await _repository.getInformationUser(username: event.username!);

        yield SuccessGetUsername(response: response);
      } catch (e) {
        yield ErrorGetUsername(messageError: e.toString());
      }
    }

    // Actualizar perfil del usuario
    if (event is EventUpdateProfile) {
      yield IsLoadingUpdateProfile();

      try {
        UserResponse response =
            await _repository.updateProfile(params: event.profileParams);

        yield SuccessUpdateProfile(response: response);
      } catch (e) {
        yield ErrorUpdateProfile(messageError: e.toString());
      }
    }

      // Actualizar perfil del usuario
    if (event is EventResetPasword) {
      yield IsLoadingResetPassword();

      try {
        UserResponse response =
            await _repository.resetPasswordInside(password: event.password!, username: event.username!);

        yield SuccessResetPassword(response: response);
      } catch (e) {
        yield ErrorUpdateProfile(messageError: e.toString());
      }
    }

    
  }
}
