// ignore_for_file: must_be_immutable

part of 'profile_police_bloc.dart';

class ProfilePoliceState extends Equatable {
  ProfilePoliceState(
      {this.profilePoliceModelObj,
      required this.isSelectedNotification,
      this.isSelectedDark = false});

  bool isSelectedNotification;

  bool isSelectedDark;

  ProfilePoliceModel? profilePoliceModelObj;

  @override
  List<Object?> get props => [
        profilePoliceModelObj,
        isSelectedNotification,
        isSelectedDark,
      ];

  ProfilePoliceState copyWith(
      {ProfilePoliceModel? profilePoliceModelObj,
      bool? isSelectedNotification,
      bool? isSelectedDark}) {
    return ProfilePoliceState(
      profilePoliceModelObj:
          profilePoliceModelObj ?? this.profilePoliceModelObj,
      isSelectedNotification:
          isSelectedNotification ?? this.isSelectedNotification,
      isSelectedDark: isSelectedDark ?? this.isSelectedDark,
    );
  }
}
