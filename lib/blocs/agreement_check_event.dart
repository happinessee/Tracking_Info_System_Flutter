import 'package:equatable/equatable.dart';

abstract class AgreementCheckEvent extends Equatable {
  const AgreementCheckEvent();

  @override
  List<Object> get props => [];
}

class Checked extends AgreementCheckEvent {
  const Checked({
    required this.allSelect,
    required this.conditionNum,
  });
  final bool allSelect;
  final int conditionNum;
}

class AllChecked extends AgreementCheckEvent {
  const AllChecked({
    required this.allSelect,
  });
  final bool allSelect;
}
