import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentDeyailsViewBody extends StatelessWidget {
  const PaymentDeyailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentMethodItem(isActive: true);
  }
}
