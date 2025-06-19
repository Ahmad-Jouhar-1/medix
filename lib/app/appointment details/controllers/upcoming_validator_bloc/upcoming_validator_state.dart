part of 'upcoming_validator_bloc.dart';

sealed class UpcomingValidatorState extends Equatable {
  const UpcomingValidatorState({
    required this.validatorName,
    required this.isValid,
  });
  final String validatorName;
  final bool isValid;

  @override
  List<Object> get props => [validatorName, isValid];
}

class UpcomingValidatorInitial extends UpcomingValidatorState {
  const UpcomingValidatorInitial()
    : super(validatorName: "Cancel", isValid: false);
}

class UpcomingValidatorUpdate extends UpcomingValidatorState {
  const UpcomingValidatorUpdate({
    required super.validatorName,
    required super.isValid,
  });
}
