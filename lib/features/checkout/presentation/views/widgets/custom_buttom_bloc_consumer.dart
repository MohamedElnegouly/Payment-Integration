import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/widgets/custom_button.dart';
import 'package:payment_integration/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_integration/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_integration/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_integration/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment_integration/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //       amount: '100',
            //       currency: 'USD',
            //       customerId: 'cus_TYrqErqdt7EC78',
            //     );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
            var transaction = transactionData();
            excutepaypalPayment(context, transaction);
          },
          isLoading: state is Paymentloading ? true : false,
          buttonText: 'Continue',
        );
      },
    );
  }

  void excutepaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          //test mode
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalsecretKey,
          transactions: [
            {
              "amount":transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list":transactionData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) transactionData() {
    var amount = AmountModel(
      currency: 'USD',
      total: '100',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(name: 'Apple', quantity: 10, price: "4", currency: 'USD'),
      OrderItemModel(name: 'Apple', quantity: 12, price: "5", currency: 'USD'),
    ];
    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
