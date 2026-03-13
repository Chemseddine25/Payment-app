import 'package:flutter/material.dart';

class CheckIconThankYou extends StatelessWidget {
  const CheckIconThankYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: const ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: OvalBorder(),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: const ShapeDecoration(
              color: Color(0xFF34A853),
              shape: OvalBorder(),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
