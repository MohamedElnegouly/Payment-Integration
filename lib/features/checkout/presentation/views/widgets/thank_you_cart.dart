import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_integration/core/utils/styles.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/card_widget_info.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/payment_Item_Info.dart';
import 'package:payment_integration/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouCart extends StatelessWidget {
  const ThankYouCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 65, left: 16, right: 16),
        child: Column(
          children: [
            Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            PaymentItemInfo(title: 'value', value: '01/24/2023'),
            const SizedBox(height: 20),
            PaymentItemInfo(title: 'Time', value: '10:15 AM'),
            const SizedBox(height: 20),
            PaymentItemInfo(title: 'To', value: 'Sam Louis'),
            const Divider(thickness: 2, height: 60),
            TotalPrice(title: 'Total', value: r'$50.97'),
            const SizedBox(height: 30),
            CardWidgetInfo(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode, size: 65),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        color: const Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.style24.copyWith(
                        color: const Color(0xFF34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.225 / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
