import 'package:bloc/bloc.dart';

import 'package:capstone/blocs/agreement_check_event.dart';
import 'package:capstone/blocs/agreement_check_state.dart';

class AgreementCheckBloc
    extends Bloc<AgreementCheckEvent, AgreementCheckState> {
  static bool allSelect = false;
  static List<bool> conditions = [false, false, false];

  AgreementCheckBloc()
      : super(AgreementCheckInitial(
          allSelect: allSelect,
          conditionNum: 0,
          conditions: conditions,
        )) {
    on<Checked>(_check);
    on<AllChecked>(_allSelect);
  }

  void _check(Checked event, Emitter<AgreementCheckState> emit) {
    state.conditions[event.conditionNum] =
        !state.conditions[event.conditionNum];
    if (state is AgreementCheckInitial || state is Disagreement) {
      emit(Agreement(
        allSelect: event.allSelect,
        conditionNum: event.conditionNum,
        conditions: state.conditions,
      ));
    } else {
      emit(Disagreement(
          allSelect: false,
          conditionNum: event.conditionNum,
          conditions: state.conditions));
    }
  }

  void _allSelect(AllChecked event, Emitter<AgreementCheckState> emit) {
    for (int i = 0; i < 3; i++) {
      state.conditions[i] = true;
    }
    emit(Agreement(
        allSelect: !state.allSelect,
        conditionNum: 0,
        conditions: state.conditions));
  }
}
