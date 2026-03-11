import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/checkout/presenation/views/thank_you_view.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/custom_credit_card.dart';
import 'package:payment_app/features/checkout/presenation/views/widgets/payment_method_list_item.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethodListItem()),
        SliverToBoxAdapter(
            child: CustomCreditCard(
          formKey: formKey,
          autovalidateMode: autovalidateMode,
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 12, left: 16, right: 16, top: 35),
              child: CustonButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushReplacementNamed(
                        context, ThankYouView.routeName);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
