// ignore_for_file: must_be_immutable

part of 'map_police_bloc.dart';

@immutable
abstract class MapPoliceEvent extends Equatable {}

class MapPoliceInitialEvent extends MapPoliceEvent {
  @override
  List<Object?> get props => [];
}
