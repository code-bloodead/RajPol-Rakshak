import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:rakshak/presentation/police/map_police_page/models/map_police_model.dart';
part 'map_police_event.dart';
part 'map_police_state.dart';

class MapPoliceBloc extends Bloc<MapPoliceEvent, MapPoliceState> {
  MapPoliceBloc(MapPoliceState initialState) : super(initialState) {
    on<MapPoliceInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MapPoliceInitialEvent event,
    Emitter<MapPoliceState> emit,
  ) async {}
}
