import 'package:flutter/material.dart';
import 'package:payment_integration/core/widgets/buildAppBar.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: MyCartViewBody(),
    );
  }
}
