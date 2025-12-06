import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const PaymentIntegration());
}

class PaymentIntegration extends StatelessWidget {
  const PaymentIntegration({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}
