import 'package:flutter/material.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentmethodListView extends StatefulWidget {
  const PaymentmethodListView({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentmethodListView> createState() => _PaymentmethodListViewState();
}

class _PaymentmethodListViewState extends State<PaymentmethodListView> {
  final List<String> images = const [
    'assets/images/cart.svg',
    'assets/images/paypal.svg',
  ];

  int isactive = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                isactive = index;
                setState(() {});
                widget.updatePaymentMethod(index: index);
              },
              child: PaymentMethodItem(
                isActive: isactive == index,
                image: images[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
