import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_appbar.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "My Cart"),
      body: const CartViewBody(),
    );
  }
}
