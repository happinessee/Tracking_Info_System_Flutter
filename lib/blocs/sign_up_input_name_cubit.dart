import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpInputNameCubit extends Cubit<String> {
  SignUpInputNameCubit() : super('');

  void onChanged(String value) => emit(value);
  void initialize() => emit('');
}
