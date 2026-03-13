import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/app_image.dart';
import 'package:payment_app/core/utils/text_style.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: Center(
      child: SvgPicture.asset(
        Assets.assetsImagesArrow,
        height: 24,
      ),
    ),
    title: Text(
      title ?? '',
      style: TextStyles.medium25,
      textAlign: TextAlign.center,
    ),
  );
}
