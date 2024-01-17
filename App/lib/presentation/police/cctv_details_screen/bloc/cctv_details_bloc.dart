import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import '/core/app_export.dart';
part 'cctv_details_event.dart';
part 'cctv_details_state.dart';

class CctvDetailsBloc extends Bloc<CctvDetailsEvent, CctvDetailsState> {
  CctvDetailsBloc(CctvDetailsState initialState) : super(initialState) {
    on<CctvDetailsInitialEvent>(_onInitialize);
  }

  Cctv cctv = Cctv(
      id: "CCTV_999",
      lat: "26.923884",
      long: "75.801752",
      streamUrl:
          "https://res.cloudinary.com/dp0ayty6p/video/upload/v1705171052/samples/fire_sample.mp4",
      title: "CCTV 5",
      address:
          "6, Vivek Nagar, Kanti Nagar, Sindhi Camp, Jaipur, Rajasthan 302016, India");
  void initializeVideoPlayer(Cctv cctv) async {
    VideoPlayerController videoPlayerController;
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(cctv.streamUrl));
    await videoPlayerController.initialize();
  }

  _onInitialize(
    CctvDetailsInitialEvent event,
    Emitter<CctvDetailsState> emit,
  ) async {
    cctv = event.cctv;
    initializeVideoPlayer(cctv);
    emit(state.copyWith());
  }
}
