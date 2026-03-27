import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/data/models/payments_intent_input.dart';
import 'package:payment_app/features/checkout/presenation/manger/cubit/payment_cubit.dart';
import 'package:payment_app/features/checkout/presenation/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/payment_method_list_item.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        PaymentMethodListItem(),
        SizedBox(height: 32),
        CustomButtonBloccosumer(),
      ]),
    );
  }
}

class CustomButtonBloccosumer extends StatelessWidget {
  const CustomButtonBloccosumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacementNamed(context, ThankYouView.routeName);
        } else if (state is PaymentFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));

          print("Stripe Error: ${state.message}");
        }
      },
      builder: (context, state) {
        return CustonButton(
          title: 'Pay Now',
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '1099',
              currency: 'USD',
              customerId: "cus_R12345",
            );

            context.read<PaymentCubit>().makePayment(
                  paymentIntentInputModel,
                );
          },
        );
      },
    );
  }
}
