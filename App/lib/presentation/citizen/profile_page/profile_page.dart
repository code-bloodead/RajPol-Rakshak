import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/core/app_export.dart';
import 'package:rakshak/widgets/app_bar/appbar_iconbutton_1.dart';
import 'package:rakshak/widgets/app_bar/appbar_subtitle.dart';
import 'package:rakshak/widgets/app_bar/custom_app_bar.dart';
import 'package:rakshak/widgets/custom_icon_button.dart';

class ProfilePage extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (context) =>
            ProfileBloc(ProfileState(profileModelObj: ProfileModel()))
              ..add(ProfileInitialEvent()),
        child: ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.gray50,
              appBar: CustomAppBar(
                  height: getVerticalSize(48),
                  leadingWidth: 64,
                  leading: AppbarIconbutton1(
                      svgPath: ImageConstant.imgArrowleft,
                      margin: getMargin(left: 24, top: 16),
                      onTap: () {
                        onTapArrowleft15(context);
                      }),
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
                                      imagePath:
                                          ImageConstant.imgRectangle36170x70,
                                      height: getSize(70),
                                      width: getSize(70),
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
                        Padding(
                            padding: getPadding(top: 8),
                            child: Text("msg_cameron_william".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeBold18.copyWith(
                                    letterSpacing: getHorizontalSize(0.2)))),
                        Padding(
                            padding: getPadding(top: 4),
                            child: Text("lbl_hello_gmail_com".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtManropeMedium14Bluegray500)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(top: 31),
                                child: Text("lbl_home_search".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtManropeExtraBold14Bluegray500
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.2))))),
                        GestureDetector(
                            onTap: () {
                              onTapRowinstagram(context);
                            },
                            child: Padding(
                                padding: getPadding(top: 15),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          variant:
                                              IconButtonVariant.FillBluegray50,
                                          shape:
                                              IconButtonShape.RoundedBorder10,
                                          padding:
                                              IconButtonPadding.PaddingAll12,
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgInstagram)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 12, bottom: 7),
                                          child: Text("lbl_recently_viewed2".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtManropeSemiBold14Gray900)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlueGray500,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin:
                                              getMargin(top: 10, bottom: 10))
                                    ]))),
                        GestureDetector(
                            onTap: () {
                              onTapMyfavorites(context);
                            },
                            child: Padding(
                                padding: getPadding(top: 16),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          variant:
                                              IconButtonVariant.FillBluegray50,
                                          shape:
                                              IconButtonShape.RoundedBorder10,
                                          padding:
                                              IconButtonPadding.PaddingAll12,
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgLocation40x40)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 12, bottom: 7),
                                          child: Text("lbl_my_favorites".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtManropeSemiBold14Gray900)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlueGray500,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin:
                                              getMargin(top: 10, bottom: 10))
                                    ]))),
                        GestureDetector(
                            onTap: () {
                              onTapPasttour(context);
                            },
                            child: Padding(
                                padding: getPadding(top: 16),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          variant:
                                              IconButtonVariant.FillBluegray50,
                                          shape:
                                              IconButtonShape.RoundedBorder10,
                                          padding:
                                              IconButtonPadding.PaddingAll12,
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgFile)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 10, bottom: 9),
                                          child: Text("lbl_past_tour".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtManropeSemiBold14Gray900)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlueGray500,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin:
                                              getMargin(top: 10, bottom: 10))
                                    ]))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(top: 32),
                                child: Text("lbl_general".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtManropeExtraBold14Bluegray500
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.2))))),
                        Padding(
                            padding: getPadding(top: 16),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomIconButton(
                                      height: 40,
                                      width: 40,
                                      variant: IconButtonVariant.FillBluegray50,
                                      shape: IconButtonShape.RoundedBorder10,
                                      padding: IconButtonPadding.PaddingAll12,
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgMenu1)),
                                  Padding(
                                      padding: getPadding(
                                          left: 16, top: 12, bottom: 7),
                                      child: Text("lbl_sell_my_home".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtManropeSemiBold14Gray900)),
                                  Spacer(),
                                  CustomImageView(
                                      svgPath: ImageConstant
                                          .imgArrowrightBlueGray500,
                                      height: getSize(20),
                                      width: getSize(20),
                                      margin: getMargin(top: 10, bottom: 10))
                                ])),
                        GestureDetector(
                            onTap: () {
                              onTapMylistings(context);
                            },
                            child: Padding(
                                padding: getPadding(top: 16),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          variant:
                                              IconButtonVariant.FillBluegray50,
                                          shape:
                                              IconButtonShape.RoundedBorder10,
                                          padding:
                                              IconButtonPadding.PaddingAll12,
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgHome44x44)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 12, bottom: 7),
                                          child: Text("lbl_my_listings".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtManropeSemiBold14Gray900)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlueGray500,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin:
                                              getMargin(top: 10, bottom: 10))
                                    ]))),
                        GestureDetector(
                            onTap: () {
                              onTapSettings(context);
                            },
                            child: Padding(
                                padding: getPadding(top: 16, bottom: 5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                          height: 40,
                                          width: 40,
                                          variant:
                                              IconButtonVariant.FillBluegray50,
                                          shape:
                                              IconButtonShape.RoundedBorder10,
                                          padding:
                                              IconButtonPadding.PaddingAll12,
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgSettings1)),
                                      Padding(
                                          padding: getPadding(
                                              left: 16, top: 12, bottom: 7),
                                          child: Text("lbl_settings".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtManropeSemiBold14Gray900)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlueGray500,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin:
                                              getMargin(top: 10, bottom: 10))
                                    ])))
                      ]))));
    });
  }

  onTapBtnEdit(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }

  onTapRowinstagram(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.recentlyViewsScreen,
    );
  }

  onTapMyfavorites(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.favoriteScreen,
    );
  }

  onTapPasttour(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.pastToursScreen,
    );
  }

  onTapMylistings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeListingScreen,
    );
  }

  onTapSettings(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.settingsScreen,
    );
  }

  onTapArrowleft15(BuildContext context) {
    NavigatorService.goBack();
  }
}
