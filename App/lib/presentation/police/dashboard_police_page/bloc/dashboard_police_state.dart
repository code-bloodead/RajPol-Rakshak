// ignore_for_file: must_be_immutable

part of 'dashboard_police_bloc.dart';

class DashboardPoliceState extends Equatable {
  DashboardPoliceState({
    this.incidentSearchController,
    this.isNotificationPresent = false,
    required this.dashboardPoliceModelObj,
  });

  TextEditingController? incidentSearchController;

  bool isNotificationPresent;

  DashboardPoliceModel dashboardPoliceModelObj;

  @override
  List<Object?> get props => [
        incidentSearchController,
        dashboardPoliceModelObj,
        isNotificationPresent,
      ];
  DashboardPoliceState copyWith({
    TextEditingController? incidentSearchController,
    required DashboardPoliceModel dashboardPoliceModelObj,
    bool? isNotificationPresent,
  }) {
    return DashboardPoliceState(
      incidentSearchController:
          incidentSearchController ?? this.incidentSearchController,
      dashboardPoliceModelObj: dashboardPoliceModelObj,
      isNotificationPresent:
          isNotificationPresent ?? this.isNotificationPresent,
    );
  }
}
