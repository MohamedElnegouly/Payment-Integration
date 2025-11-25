import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const PaymentIntegration());
}

class PaymentIntegration extends StatelessWidget {
  const PaymentIntegration({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCartView(),
    );
  }
}
