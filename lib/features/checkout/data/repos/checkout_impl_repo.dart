import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failures.dart';
import 'package:payment_app/core/services/payment_stripe.dart';
import 'package:payment_app/features/checkout/data/models/payments_intent_input.dart';
import 'package:payment_app/features/checkout/domain/repos/checkout_repo.dart';

class CheckoutImplRepo implements CheckoutRepo {
  final StripeService stripeService;

  CheckoutImplRepo(this.stripeService);
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
