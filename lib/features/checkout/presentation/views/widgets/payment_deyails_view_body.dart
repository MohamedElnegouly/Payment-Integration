import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/Custom_credit_cart.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDeyailsViewBody extends StatelessWidget {
  const PaymentDeyailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [PaymentmethodListView(), CustomCreditCart()]),
    );
  }
}

