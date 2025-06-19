part of 'request_types_bloc.dart';

sealed class RequestTypesEvent {}

class CurrentRequestTypeIdChanged extends RequestTypesEvent {
  final int currentRequestTypeId;

  CurrentRequestTypeIdChanged({required this.currentRequestTypeId});
}

class IsDroppedDownToggled extends RequestTypesEvent {}

class RequestTypesAreActivated extends RequestTypesEvent {}

class ActivatedAndRequestTypeIdsAreSet extends RequestTypesEvent {
  final int requestTypeId;

  ActivatedAndRequestTypeIdsAreSet({required this.requestTypeId});
}

class RequestTypesReset extends RequestTypesEvent {}
