import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/custom_buttom_bloc_consumer.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentMethodsButtomSheet extends StatelessWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          PaymentmethodListView(),
          const SizedBox(height: 16),
          CustomButtomBlocConsumer(),
        ],
      ),
    );
  }
}
