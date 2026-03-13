import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/core/utils/app_image.dart';
import 'package:payment_app/core/utils/text_style.dart';

class PaymentCardInfo extends StatelessWidget {
  const PaymentCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(Assets.assetsImagesLogo),
        const SizedBox(
          width: 23,
        ),
        const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card ',
                  style: TextStyles.regular18,
                ),
                TextSpan(text: 'Mastercard **78 ', style: TextStyles.regular18),
              ],
            ),
          ),
        ])
      ]),
    );
  }
}
