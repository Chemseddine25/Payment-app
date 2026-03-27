import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/text_style.dart';

class CustonButton extends StatelessWidget {
  const CustonButton({super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;

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
        child: Center(
            child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.medium22,
        )),
      ),
    );
  }
}
