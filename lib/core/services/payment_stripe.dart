import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/services/api_service.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/features/checkout/data/models/payments_intent_input.dart';

class StripleService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/payment_intents",
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentinitentclientscret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentinitentclientscret,
        merchantDisplayName: ' chemssou Store ',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
        paymentinitentclientscret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
