import 'package:dartz/dartz.dart';
import 'package:payment_integration/core/errors/failure.dart';
import 'package:payment_integration/core/utils/stripe_service.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makepayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerError(e.toString()));
    }
  }
}
