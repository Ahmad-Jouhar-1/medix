import 'package:flutter_bloc/flutter_bloc.dart';

part 'titled_checkbox_event.dart';
part 'titled_checkbox_state.dart';

class TitledCheckboxBloc
    extends Bloc<TitledCheckboxEvent, TitledCheckboxState> {
  TitledCheckboxBloc() : super(TitledCheckboxInitial()) {
    on<IsCurrentCheckedToggled>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: state.isPreviousChecked,
          isCurrentChecked: !state.isCurrentChecked,
          isActive: state.isActive,
        ),
      );
    });

    on<TitledCheckboxIsActivated>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: state.isPreviousChecked,
          isCurrentChecked: state.isCurrentChecked,
          isActive: true,
        ),
      );
    });

    on<ActivatedAndChecksAreSet>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: event.isChecked,
          isCurrentChecked: event.isChecked,
          isActive: true,
        ),
      );
    });

    on<TitledCheckboxReset>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: false,
          isCurrentChecked: false,
          isActive: false,
        ),
      );
    });
  }
}
