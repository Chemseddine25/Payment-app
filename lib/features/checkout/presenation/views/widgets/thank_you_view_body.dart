import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/check_icon_thank_you.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/divider_thank_you_view.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 64,
        left: 20,
        right: 20,
        bottom: 27,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: -15,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: -15,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2 + 20,
            left: 20 + 16,
            right: 20 + 16,
            child: Row(
              children:
                  List.generate(30, (index) => const DividerThankYouView()),
            ),
          ),
          const CheckIconThankYou(),
        ],
      ),
    );
  }
}
