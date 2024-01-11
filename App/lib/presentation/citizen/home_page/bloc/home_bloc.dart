import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/data/models/home/get_incident_resp.dart';
import 'package:rakshak/data/repository/repository.dart';
import '/core/app_export.dart';
import 'package:rakshak/presentation/citizen/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<onIncidentSearch>(_onIncidentSearch);
  }

  List<Incident> incidentList = [];
  List<Incident> tempIncidentList = [];
  var getIncidentResp = GetIncidentResp();
  final _repository = Repository();

  _onIncidentSearch(
    onIncidentSearch event,
    Emitter<HomeState> emit,
  ) {
    if (event.searchVal.isEmpty) {
      tempIncidentList = incidentList;
    } else {
      // if not empty then filter incidents based on searchVal on title as well as station_name and location
      tempIncidentList = incidentList
          .where((element) =>
              element.title!
                  .toLowerCase()
                  .startsWith(event.searchVal.toLowerCase()) ||
              element.station_name!
                  .toLowerCase()
                  .startsWith(event.searchVal.toLowerCase()) ||
              element.location!
                  .toLowerCase()
                  .startsWith(event.searchVal.toLowerCase()))
          .toList();
    }
    print(tempIncidentList.toString());
    emit(state.copyWith(
        homeModelObj: state.homeModelObj.copyWith(
      incidentList: incidentList,
      tempIncidentList: tempIncidentList,
    )));
  }

  Future<List<Incident>> fillIncidentList() async {
    // List<Incident> userReports = [];

    // try {
    //   getIncidentResp = await _repository.getIncident(PrefUtils().getMobile());
    //   userReports = getIncidentResp.dataList!;
    // } catch (error) {
    //   print(error);
    // }

    return userReports;
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    incidentList = await fillIncidentList();
    tempIncidentList = incidentList;
    emit(state.copyWith(
        homeModelObj: HomeModel(),
        incidentSearchController: TextEditingController()));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj.copyWith(
      incidentList: incidentList,
      tempIncidentList: tempIncidentList,
    )));
  }
}
