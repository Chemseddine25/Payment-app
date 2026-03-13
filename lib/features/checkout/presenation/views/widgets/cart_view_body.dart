import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_image.dart';
import 'package:payment_app/core/utils/text_style.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/payment_method_list_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 26,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 424 / 277,
              child: Image.asset(
                Assets.assetsImagesCart,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const OrderItemInfo(
            title: ' Order Subtotal',
            price: ' 42.97',
          ),
          const OrderItemInfo(
            title: ' Discount',
            price: ' 0',
          ),
          const OrderItemInfo(
            title: ' Shipping',
            price: ' 8',
          ),
          const SizedBox(
            height: 17,
          ),
          const CustomDevider(),
          const SizedBox(
            height: 15,
          ),
          const TotalPrice(price: '50.97'),
          const SizedBox(
            height: 16,
          ),
          CustonButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                builder: (context) {
                  return const PaymentMethodsBottomSheet();
                },
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class OrderItemInfo extends StatelessWidget {
  const OrderItemInfo({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.regular18,
        ),
        const Spacer(),
        Text(
          '\$$price',
          textAlign: TextAlign.center,
          style: TextStyles.regular18,
        ),
      ],
    );
  }
}

class CustomDevider extends StatelessWidget {
  const CustomDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFC6C6C6),
          ),
        ),
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text('Total',
          textAlign: TextAlign.center, style: TextStyles.semiBold24),
      const Spacer(),
      Text(
        ' \$$price',
        textAlign: TextAlign.center,
        style: TextStyles.semiBold24,
      ),
    ]);
  }
}

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const PaymentMethodListItem(),
        const SizedBox(height: 32),
        CustonButton(
          onTap: () {},
        ),
      ]),
    );
  }
}
