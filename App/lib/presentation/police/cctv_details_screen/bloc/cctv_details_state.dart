// ignore_for_file: must_be_immutable

part of 'cctv_details_bloc.dart';

class CctvDetailsState extends Equatable {
  CctvDetailsState({
    this.silderIndex = 0,
    this.radioGroup = "",
    this.cctv,
  });

  Cctv? cctv;

  int silderIndex;

  String radioGroup;

  @override
  List<Object?> get props => [
        silderIndex,
        radioGroup,
        cctv,
      ];
  CctvDetailsState copyWith({
    int? silderIndex,
    String? radioGroup,
    Cctv? cctv,
  }) {
    return CctvDetailsState(
      silderIndex: silderIndex ?? this.silderIndex,
      radioGroup: radioGroup ?? this.radioGroup,
      cctv: cctv ?? this.cctv,
    );
  }
}
