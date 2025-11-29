import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/custom_check-icon.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/thank_you_cart.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCart(),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.225,
            left: 28,
            right: 28,
            child: CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(left: 0, right: 0, top: -50, child: CustomCheckIcon()),
        ],
      ),
    );
  }
}
