import 'bloc/map_police_bloc.dart';
import 'models/map_police_model.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/core/app_export.dart';
import 'package:rakshak/widgets/app_bar/appbar_subtitle.dart';
import 'package:rakshak/widgets/app_bar/custom_app_bar.dart';
import 'package:rakshak/widgets/custom_button.dart';
import 'package:rakshak/widgets/custom_icon_button.dart';

class MapPolicePage extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<MapPoliceBloc>(
        create: (context) => MapPoliceBloc(MapPoliceState(
              mapPoliceModelObj: MapPoliceModel(),
            ))
              ..add(MapPoliceInitialEvent()),
        child: MapPolicePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapPoliceBloc, MapPoliceState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.gray50,
              appBar: CustomAppBar(
                  height: getVerticalSize(48),
                  centerTitle: true,
                  title: AppbarSubtitle(
                    text: "lbl_profile".tr,
                    margin: EdgeInsets.only(top: 16),
                  )),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 24, top: 32, right: 24, bottom: 32),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: getSize(70),
                            width: getSize(70),
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgUserSample,
                                      height: getSize(80),
                                      width: getSize(80),
                                      radius: BorderRadius.circular(
                                          getHorizontalSize(35)),
                                      alignment: Alignment.center),
                                  CustomIconButton(
                                      height: 24,
                                      width: 24,
                                      variant:
                                          IconButtonVariant.OutlineBluegray50_2,
                                      shape: IconButtonShape.RoundedBorder10,
                                      padding: IconButtonPadding.PaddingAll5,
                                      alignment: Alignment.bottomRight,
                                      onTap: () {
                                        onTapBtnEdit(context);
                                      },
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgEdit12x12))
                                ])),
                      ]))));
    });
  }

  onTapBtnEdit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
