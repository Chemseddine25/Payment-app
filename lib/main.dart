import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/helper_function/ongenerate_route.dart';
import 'package:payment_app/core/services/git_it_service.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/presenation/views/cart_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetit();
  Stripe.publishableKey = ApiKeys.publicKey;
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
