import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/payment_method_list_item.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [PaymentMethodListItem()],
    );
  }
}
