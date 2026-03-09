import 'package:flutter/material.dart';
import 'package:payment_app/core/helper_function/ongenerate_route.dart';
import 'package:payment_app/features/checkout/presenation/views/cart_view.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        onGenerateRoute: onGenerateRoute, initialRoute: CartView.routeName);
  }
}
