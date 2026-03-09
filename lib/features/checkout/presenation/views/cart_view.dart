import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/core/utils/app_image.dart';
import 'package:payment_app/core/utils/text_style.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Center(
          child: SvgPicture.asset(
            Assets.assetsImagesArrow,
            height: 24,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'My Cart',
          style: TextStyles.medium25,
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Text('Cart View'),
      ),
    );
  }
}
