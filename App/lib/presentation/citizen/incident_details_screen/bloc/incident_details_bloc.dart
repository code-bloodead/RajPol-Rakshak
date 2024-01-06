import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/data/models/home/post_incident_resp.dart';
import '/core/app_export.dart';
part 'incident_details_event.dart';
part 'incident_details_state.dart';

class IncidentDetailsBloc
    extends Bloc<IncidentDetailsEvent, IncidentDetailsState> {
  IncidentDetailsBloc(IncidentDetailsState initialState) : super(initialState) {
    on<IncidentDetailsInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
  }

  _changeRadioButton(
    ChangeRadioButtonEvent event,
    Emitter<IncidentDetailsState> emit,
  ) {
    emit(state.copyWith(radioGroup: event.value));
  }

  _onInitialize(
    IncidentDetailsInitialEvent event,
    Emitter<IncidentDetailsState> emit,
  ) async {
    emit(state.copyWith(silderIndex: 0, radioGroup: ""));
  }
}
