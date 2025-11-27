import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_integration/core/utils/styles.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
      body: MyCartViewBody(),
    );
  }
}
