import 'package:flutter/material.dart';
import 'package:payment_integration/core/widgets/buildAppBar.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: const Offset(0, -20),
        child: ThankYouViewBody(),
      ),
    );
  }
}
