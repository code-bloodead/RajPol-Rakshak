import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
part 'cctv_details_event.dart';
part 'cctv_details_state.dart';

class CctvDetailsBloc extends Bloc<CctvDetailsEvent, CctvDetailsState> {
  CctvDetailsBloc(CctvDetailsState initialState) : super(initialState) {
    on<CctvDetailsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CctvDetailsInitialEvent event,
    Emitter<CctvDetailsState> emit,
  ) async {
    emit(state.copyWith(silderIndex: 0, radioGroup: ""));
  }
}
