import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/services/api_service.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/data/models/ephermeral_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_app/features/checkout/data/models/payments_intent_input.dart';
import 'package:dio/dio.dart';

class StripeService {
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

  Future<String> createCustomer(String email) async {
    // 1. نرسل طلب POST لرابط العملاء الخاص بـ Stripe
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customers',

      // 2. نرسل إيميل المستخدم (اختياري لكنه مفيد للتعرف عليه في Stripe Dashboard)
      body: email.isEmpty ? {} : {'email': email},

      // 3. نستخدم الـ Secret Key الخاص بك (sk_test_...)
      token: ApiKeys.secretKey,

      // 4. كما اتفقنا سابقاً، Stripe يحتاج هذا النوع من البيانات
      contentType: Headers.formUrlEncodedContentType,
    );

    // 5. السيرفر سيرد بـ JSON يحتوي على حقل اسمه 'id'
    // قيمته تكون مثل: cus_QWERTY123456
    return response.data['id'];
  }

  // داخل stripe_service.dart
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-10-16', // مهم جداً: نسخة الـ API
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  Future initPaymentSheet({
    required String paymentinitentclientscret,
    required String customerId,
    required String ephemeralKeySecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentinitentclientscret,
        customerEphemeralKeySecret: ephemeralKeySecret,
        customerId: customerId,
        merchantDisplayName: ' chemssou Store ',
        allowsDelayedPaymentMethods: true,
        setupIntentClientSecret: paymentinitentclientscret,
        style: ThemeMode.dark,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    //String realCustomerId = await createCustomer("shams@example.com");
    String realCustomerId = "cus_UE7XoufNlsTwJX";

    // 2. اطبع الـ ID الجديد في الـ Console
    print("COPY THIS ID NOW: $realCustomerId");

    EphemeralKeyModel ephemeralKey =
        await createEphemeralKey(customerId: realCustomerId);

    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: PaymentIntentInputModel(
        amount: paymentIntentInputModel.amount,
        currency: paymentIntentInputModel.currency,
        customerId: realCustomerId, // نستخدم الـ ID الذي يبدأ بـ cus_ هنا
      ),
    );
    await initPaymentSheet(
        paymentinitentclientscret: paymentIntentModel.clientSecret!,
        customerId: realCustomerId,
        ephemeralKeySecret: ephemeralKey.secret!);

    await displayPaymentSheet();
  }
}
