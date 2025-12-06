import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(Paymentloading());
    var data = await checkoutRepo.makepayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (l) => emit(PaymentFailure(errorMessage: l.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
