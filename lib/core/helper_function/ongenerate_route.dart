import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presenation/views/cart_view.dart';
import 'package:payment_app/features/checkout/presenation/views/payment_details_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CartView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CartView(),
      );

    case PaymentDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PaymentDetailsView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
      
  
      
    // You can add more routes here in the future
    
 
    
 