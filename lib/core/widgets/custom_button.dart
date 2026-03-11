import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/text_style.dart';

class CustonButton extends StatelessWidget {
  const CustonButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Center(
            child: Text(
          'Complete Payment',
          textAlign: TextAlign.center,
          style: TextStyles.medium22,
        )),
      ),
    );
  }
}
