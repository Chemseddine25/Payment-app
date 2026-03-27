import 'package:get_it/get_it.dart';
import 'package:payment_app/core/services/payment_stripe.dart';
import 'package:payment_app/features/checkout/data/repos/checkout_impl_repo.dart';
import 'package:payment_app/features/checkout/domain/repos/checkout_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<StripeService>(StripeService());

  getIt.registerSingleton<CheckoutRepo>(
    CheckoutImplRepo(getIt.get<StripeService>()),
  );
}
