import 'package:flutter/material.dart';
import 'package:payment_integration/core/widgets/custom_button.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/Custom_credit_cart.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDeyailsViewBody extends StatelessWidget {
  const PaymentDeyailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentmethodListView()),
        SliverToBoxAdapter(child: CustomCreditCart()),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
              child: CustomButton(buttonText: 'pay now'),
            ),
          ),
        ),
      ],
    );
  }
}
