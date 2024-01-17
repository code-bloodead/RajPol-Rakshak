import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/data/models/home/get_incident_resp.dart';
import '/core/app_export.dart';
import 'package:rakshak/presentation/police/map_police_page/models/map_police_model.dart';
part 'map_police_event.dart';
part 'map_police_state.dart';

class MapPoliceBloc extends Bloc<MapPoliceEvent, MapPoliceState> {
  MapPoliceBloc(MapPoliceState initialState) : super(initialState) {
    on<MapPoliceInitialEvent>(_onInitialize);
    on<PlotTypeChangeEvent>(_onPlotTypeChange);
  }

  List<Incident> incidentsList = [];

  Future<List<Incident>> fillIncidentList() async {
    // List<Incident> userReports = [];

    // try {
    // getIncidentResp = await _repository.getIncident(PrefUtils().getMobile());
    //   userReports = getIncidentResp.dataList!;
    // } catch (error) {
    //   print(error);
    // }

    return userReports;
  }

  _onInitialize(
    MapPoliceInitialEvent event,
    Emitter<MapPoliceState> emit,
  ) async {
    incidentsList = await fillIncidentList();
    emit(state.copyWith(incidentsList: incidentsList));
  }

  _onPlotTypeChange(
    PlotTypeChangeEvent event,
    Emitter<MapPoliceState> emit,
  ) async {
    emit(state.copyWith(plotType: event.plotType));
  }
}
