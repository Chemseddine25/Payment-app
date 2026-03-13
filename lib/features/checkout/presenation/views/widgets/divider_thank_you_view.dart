import 'package:flutter/material.dart';

class DividerThankYouView extends StatelessWidget {
  const DividerThankYouView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          color: const Color(0xFFB7B7B7),
          height: 1,
        ),
      ),
    );
  }
}
