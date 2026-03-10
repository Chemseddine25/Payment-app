import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/core/utils/app_image.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key,
      required this.isActive,
      required this.onTap,
      required this.image});
  final bool isActive;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 103,
          height: 62,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: isActive
                    ? const Color(0xFF34A853)
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: isActive
                ? const [
                    BoxShadow(
                      color: Color(0xFF34A853),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ]
                : [],
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Center(
                  child: SvgPicture.asset(
                image,
                height: 24,
              ))),
        ));
  }
}
