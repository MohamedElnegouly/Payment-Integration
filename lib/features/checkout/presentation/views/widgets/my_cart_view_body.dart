import 'package:flutter/material.dart';
import 'package:payment_integration/core/widgets/custom_button.dart';
import 'package:payment_integration/features/checkout/presentation/views/payment_details.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/order_Info_Item.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 18),
          Expanded(child: Image.asset('assets/images/basket.png')),
          SizedBox(height: 20),
          OrderInfoItem(title: 'Order Subtotal', value: r'$42.29'),
          SizedBox(height: 3),
          OrderInfoItem(title: 'Discount', value: r'$0'),
          SizedBox(height: 3),
          OrderInfoItem(title: 'Shipping', value: r'$8'),
          const Divider(thickness: 2, color: Color(0xFFC6C6C6), height: 34),
          TotalPrice(title: 'Title', value: r'$50.97'),
          SizedBox(height: 16),
          CustomButton(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PaymentDetails();
                  },
                ),
              );
            },
            buttonText: 'Complete Payment',
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
