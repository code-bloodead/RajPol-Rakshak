import 'bloc/cctv_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rakshak/core/app_export.dart';
import 'package:rakshak/widgets/custom_icon_button.dart';

class CctvDetailsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return BlocProvider<CctvDetailsBloc>(
      create: (context) {
        return CctvDetailsBloc(CctvDetailsState(
          cctv: arg["cctv"],
        ))
          ..add(CctvDetailsInitialEvent());
      },
      child: CctvDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.gray50,
      body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
              child: Padding(
                  padding: getPadding(left: 16, top: 33, bottom: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            CustomIconButton(
                              height: 36,
                              width: 36,
                              variant: IconButtonVariant.OutlineGray300_1,
                              child: CustomImageView(
                                svgPath: ImageConstant.imgArrowleft,
                                height: getSize(20),
                                width: getSize(20),
                              ),
                              onTap: () {
                                onTapBack(context);
                              },
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              alignment: Alignment.center,
                              child: Text(
                                "lbl_cctv_surveillance".tr,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.txtManropeExtraBold18.copyWith(
                                  letterSpacing: getHorizontalSize(0.2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])))),
    ));
  }
}

onTapBack(BuildContext context) {
  NavigatorService.goBack();
}
