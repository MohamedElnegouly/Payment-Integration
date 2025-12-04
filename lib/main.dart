import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const PaymentIntegration());
}

class PaymentIntegration extends StatelessWidget {
  const PaymentIntegration({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}

//flow
//paymentintentobject create payment intent (amount , currency)
// init payment sheet (paymentIntentClientSecret)
// present payment sheet
