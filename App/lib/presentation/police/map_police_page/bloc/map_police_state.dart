// ignore_for_file: must_be_immutable

part of 'map_police_bloc.dart';

class MapPoliceState extends Equatable {
  MapPoliceState({
    this.mapPoliceModelObj,
  });

  MapPoliceModel? mapPoliceModelObj;

  @override
  List<Object?> get props => [
        mapPoliceModelObj,
      ];

  MapPoliceState copyWith(
      {MapPoliceModel? mapPoliceModelObj,
      bool? isSelectedNotification,
      bool? isSelectedDark}) {
    return MapPoliceState(
      mapPoliceModelObj: mapPoliceModelObj ?? this.mapPoliceModelObj,
    );
  }
}
