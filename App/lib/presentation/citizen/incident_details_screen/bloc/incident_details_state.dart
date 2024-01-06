// ignore_for_file: must_be_immutable

part of 'incident_details_bloc.dart';

class IncidentDetailsState extends Equatable {
  IncidentDetailsState({
    this.silderIndex = 0,
    this.radioGroup = "",
    this.incident,
  });

  Incident? incident;

  int silderIndex;

  String radioGroup;

  @override
  List<Object?> get props => [
        silderIndex,
        radioGroup,
        incident,
      ];
  IncidentDetailsState copyWith({
    int? silderIndex,
    String? radioGroup,
    Incident? incident,
  }) {
    return IncidentDetailsState(
      silderIndex: silderIndex ?? this.silderIndex,
      radioGroup: radioGroup ?? this.radioGroup,
      incident: incident ?? this.incident,
    );
  }
}
