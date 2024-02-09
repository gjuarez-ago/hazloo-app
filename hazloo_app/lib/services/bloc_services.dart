import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazloo_app/bloc/bloc.dart';


List<BlocProvider> blocsServices(String token) {
  return [
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
    ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
    ),
    BlocProvider<RecoveryPasswordBloc>(
      create: (context) => RecoveryPasswordBloc(),
    ),
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
    ),
    BlocProvider<TaskBloc>(
      create: (context) => TaskBloc(),
    ),
    BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc(),
    ),
    BlocProvider<LogBloc>(
      create: (context) => LogBloc(),
    ),
  ];
}
