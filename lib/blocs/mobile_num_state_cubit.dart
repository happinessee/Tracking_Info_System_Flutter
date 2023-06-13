import 'package:flutter_bloc/flutter_bloc.dart';

enum MobileNumState {
  mobileNumNotReady,
  mobileNumReady,
}

class MobileNumStateCubit extends Cubit<MobileNumState> {
  MobileNumStateCubit() : super(MobileNumState.mobileNumNotReady);
  String number = '';

  void mobileNotReady() => emit(MobileNumState.mobileNumNotReady);
  void mobileReady() => emit(MobileNumState.mobileNumReady);
  void changeNumber(String value) => number = value;
}
