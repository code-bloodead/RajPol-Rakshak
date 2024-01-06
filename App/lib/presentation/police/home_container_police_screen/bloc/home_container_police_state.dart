// ignore_for_file: must_be_immutable

part of 'home_container_police_bloc.dart';

class HomeContainerPoliceState extends Equatable {
  HomeContainerPoliceState({
    this.id,
    this.station,
    this.fullname,
    this.homeContainerPoliceModelObj,
  });

  HomeContainerPoliceModel? homeContainerPoliceModelObj;

  var id;
  var station;
  var fullname;

  @override
  List<Object?> get props => [
        id,
        station,
        fullname,
        homeContainerPoliceModelObj,
      ];
  HomeContainerPoliceState copyWith({
    var id,
    var mobile,
    var fullname,
    HomeContainerPoliceModel? homeContainerPoliceModelObj,
  }) {
    return HomeContainerPoliceState(
      id: id ?? this.id,
      station: station ?? this.station,
      fullname: fullname ?? this.fullname,
      homeContainerPoliceModelObj:
          homeContainerPoliceModelObj ?? this.homeContainerPoliceModelObj,
    );
  }
}
