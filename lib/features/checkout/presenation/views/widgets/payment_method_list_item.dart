import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_image.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/payment_methodItem.dart';

class PaymentMethodListItem extends StatefulWidget {
  const PaymentMethodListItem({
    super.key,
  });

  @override
  State<PaymentMethodListItem> createState() => _PaymentMethodListItemState();
}

class _PaymentMethodListItemState extends State<PaymentMethodListItem> {
  int currentIndex = 0;

  final List<String> image = const [
    Assets.assetsImagesVisa,
    Assets.assetsImagesPaypal,
    Assets.assetsImagesPay,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            image.length,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PaymentMethodItem(
                      image: image[index],
                      isActive: index == currentIndex,
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                )));
  }
}
