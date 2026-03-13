import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/text_style.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/cart_view_body.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/payment_card_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16 + 30, right: 16, left: 16),
          child: Column(children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: TextStyles.medium25,
            ),
            const Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: TextStyles.regular18,
            ),
            const SizedBox(
              height: 10,
            ),
            const PaymentItemInfo(title: 'Order ID', value: '01/01/2023'),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(title: 'Date', value: '10:00 AM'),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(title: 'To', value: 'Adjas chems eddine'),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xFFB7B7B7),
              thickness: 1,
            ),
            const SizedBox(
              height: 12,
            ),
            const TotalPrice(price: ' 100'),
            const SizedBox(
              height: 16,
            ),
            const PaymentCardInfo(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 70,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 15),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'PAID',
                    style: TextStyles.semiBold18
                        .copyWith(color: const Color(0xFF34A853)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ]),
        ));
  }
}

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.regular18,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold18,
        ),
      ],
    );
  }
}
