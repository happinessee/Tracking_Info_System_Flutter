import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthMessageState { initial, authNumNotSend, authNumSend, authCompleted }

class AuthMessageStateCubit extends Cubit<AuthMessageState> {
  AuthMessageStateCubit() : super(AuthMessageState.initial);
  String authNumber = '';

  void authNotSend() => emit(AuthMessageState.authNumNotSend);
  void authSend() => emit(AuthMessageState.authNumSend);
  void authCompleted() => emit(AuthMessageState.authCompleted);
  void changeAuthNumber(String value) => authNumber = value;
}
