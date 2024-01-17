// ignore_for_file: must_be_immutable

part of 'cctv_details_bloc.dart';

@immutable
abstract class CctvDetailsEvent extends Equatable {}

class CctvDetailsInitialEvent extends CctvDetailsEvent {
  @override
  CctvDetailsInitialEvent({required this.cctv});
  Cctv cctv;
  List<Object?> get props => [cctv];
}
