import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presenation/views/cart_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CartView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CartView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
      
  
      
    // You can add more routes here in the future
    
 
    
 