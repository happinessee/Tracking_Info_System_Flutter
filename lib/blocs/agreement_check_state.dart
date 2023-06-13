import 'package:equatable/equatable.dart';

abstract class AgreementCheckState extends Equatable {
  const AgreementCheckState({
    required this.allSelect,
    required this.conditionNum,
    required this.conditions,
  });
  final bool allSelect;
  final List<bool> conditions;
  final int conditionNum;

  @override
  List<Object> get props => [allSelect, conditions, conditionNum];

  bool check() {
    for (int i = 0; i < conditions.length; i++) {
      if (conditions[i]) {
        continue;
      } else {
        return (false);
      }
    }
    return (true);
  }
}

class AgreementCheckInitial extends AgreementCheckState {
  const AgreementCheckInitial({
    required super.allSelect,
    required super.conditionNum,
    required super.conditions,
  });
}

class Agreement extends AgreementCheckState {
  const Agreement({
    required super.allSelect,
    required super.conditionNum,
    required super.conditions,
  });
}

class Disagreement extends AgreementCheckState {
  const Disagreement({
    required super.allSelect,
    required super.conditionNum,
    required super.conditions,
  });
}
