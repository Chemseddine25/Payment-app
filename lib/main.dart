import 'package:flutter/material.dart';
import 'package:payment_app/core/helper_function/ongenerate_route.dart';
import 'package:payment_app/features/checkout/presenation/views/cart_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: onGenerateRoute,
        initialRoute: CartView.routeName);
  }
}
