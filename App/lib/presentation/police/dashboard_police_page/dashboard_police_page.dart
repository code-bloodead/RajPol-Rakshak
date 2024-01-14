import 'package:rakshak/widgets/custom_icon_button.dart';
import 'bloc/dashboard_police_bloc.dart';
import 'models/dashboard_police_model.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/core/app_export.dart';
import 'package:rakshak/widgets/app_bar/appbar_iconbutton.dart';
import 'package:rakshak/widgets/app_bar/appbar_image.dart';
import 'package:rakshak/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:rakshak/widgets/app_bar/custom_app_bar.dart';

class DashboardPolicePage extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardPoliceBloc>(
        create: (context) => DashboardPoliceBloc(DashboardPoliceState(
            dashboardPoliceModelObj: DashboardPoliceModel()))
          ..add(DashboardPoliceInitialEvent()),
        child: DashboardPolicePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(60),
                title: Padding(
                    padding: getPadding(left: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppbarSubtitle2(
                              text: "Welcome,",
                              margin: getMargin(right: 136, top: 20)),
                          Padding(
                              padding: getPadding(top: 1),
                              child: Row(children: [
                                AppbarImage(
                                    height: getSize(20),
                                    width: getSize(20),
                                    svgPath: ImageConstant.imgUser,
                                    margin: getMargin(bottom: 3, top: 3)),
                                SizedBox(width: getSize(6)),
                                Text(PrefUtils().getName(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtManropeExtraBold14Gray900
                                        .copyWith(
                                            letterSpacing:
                                                getHorizontalSize(0.2))),
                              ]))
                        ])),
                actions: [
                  BlocSelector<DashboardPoliceBloc, DashboardPoliceState, bool>(
                    selector: (state) => state.isNotificationPresent,
                    builder: (context, isNotificationPresent) {
                      return AppbarIconbutton(
                          svgPath: isNotificationPresent
                              ? ImageConstant.imgNotificationPresent
                              : ImageConstant.imgNotificationNone,
                          margin: getMargin(left: 12, top: 10, right: 34),
                          onTap: () {
                            onTapNotification(context);
                          });
                    },
                  )
                ],
                styleType: Style.bgFillGray50),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            getPadding(left: 24, top: 24, right: 24, bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: getMargin(right: 8),
                                      child: CustomImageView(
                                          width: getSize(20),
                                          svgPath:
                                              ImageConstant.imgPoliceStation)),
                                  Padding(
                                    padding: getPadding(top: 4),
                                    child: Text(
                                        PrefUtils().getStation() + " Station",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtManropeBold12
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2))),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 4, left: 4),
                                    child: Text(
                                        "(" +
                                            formatDate(
                                                DateTime.now().toString()) +
                                            ")",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtManropeBold12
                                            .copyWith(
                                                letterSpacing:
                                                    getHorizontalSize(0.2))),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: getPadding(top: 16),
                                child: Row(children: [
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: AppDecoration.outlineGray300
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Row(
                                      children: [
                                        CustomIconButton(
                                            height: 34,
                                            width: 34,
                                            variant:
                                                IconButtonVariant.FillBlue500,
                                            shape:
                                                IconButtonShape.RoundedBorder5,
                                            child: CustomImageView(
                                                color: ColorConstant.whiteA700,
                                                svgPath:
                                                    ImageConstant.imgMenu1)),
                                        Padding(
                                            padding: getPadding(left: 8),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_reported".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtManrope10
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.4))),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 1),
                                                      child: Text("6 incidents",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtManropeBold12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.3))))
                                                ])),
                                      ],
                                    ),
                                  )),
                                  SizedBox(width: getSize(10)),
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: AppDecoration.outlineGray300
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Row(
                                      children: [
                                        CustomIconButton(
                                            height: 34,
                                            width: 34,
                                            variant:
                                                IconButtonVariant.FillBlue500,
                                            shape:
                                                IconButtonShape.RoundedBorder5,
                                            child: CustomImageView(
                                                color: ColorConstant.whiteA700,
                                                svgPath:
                                                    ImageConstant.imgCctv)),
                                        Padding(
                                            padding: getPadding(left: 8),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text("lbl_detected".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtManrope10
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.3))),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 1),
                                                      child: Text("4 incidnets",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtManropeBold12
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.4))))
                                                ])),
                                      ],
                                    ),
                                  )),
                                ]),
                              ),
                            ]))))));
  }

  onTapNotification(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }
}
