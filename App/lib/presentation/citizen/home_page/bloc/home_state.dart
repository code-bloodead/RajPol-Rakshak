// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomeState({
    this.incidentSearchController,
    required this.homeModelObj,
  });

  TextEditingController? incidentSearchController;

  HomeModel homeModelObj;

  @override
  List<Object?> get props => [
        incidentSearchController,
        homeModelObj,
      ];
  HomeState copyWith({
    TextEditingController? incidentSearchController,
    required HomeModel homeModelObj,
  }) {
    return HomeState(
      incidentSearchController:
          incidentSearchController ?? this.incidentSearchController,
      homeModelObj: homeModelObj,
    );
  }
}
