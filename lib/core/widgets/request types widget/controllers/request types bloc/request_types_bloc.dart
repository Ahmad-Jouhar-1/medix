import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_types_event.dart';
part 'request_types_state.dart';

class RequestTypesBloc extends Bloc<RequestTypesEvent, RequestTypesState> {
  RequestTypesBloc() : super(RequestTypesInitial()) {
    on<CurrentRequestTypeIdChanged>((event, emit) {
      log(event.currentRequestTypeId.toString());
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: event.currentRequestTypeId,
          previousRequestTypeId: state.previousRequestTypeId,
          isDroppedDown: state.isDroppedDown,
          isActive: state.isActive,
        ),
      );
    });

    on<IsDroppedDownToggled>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: state.currentRequestTypeId,
          previousRequestTypeId: state.previousRequestTypeId,
          isDroppedDown: !state.isDroppedDown,
          isActive: state.isActive,
        ),
      );
    });

    on<RequestTypesAreActivated>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: state.currentRequestTypeId,
          previousRequestTypeId: state.previousRequestTypeId,
          isDroppedDown: state.isDroppedDown,
          isActive: true,
        ),
      );
    });

    on<ActivatedAndRequestTypeIdsAreSet>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: event.requestTypeId,
          previousRequestTypeId: event.requestTypeId,
          isDroppedDown: state.isDroppedDown,
          isActive: true,
        ),
      );
    });

    on<RequestTypesReset>((event, emit) {
      emit(
        RequestTypesUpdated(
          currentRequestTypeId: -1,
          previousRequestTypeId: -1,
          isDroppedDown: false,
          isActive: false,
        ),
      );
    });
  }
}
