import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_integration/core/widgets/custom_button.dart';
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  //test mode
                  sandboxMode: true,
                  clientId: "",
                  secretKey: "",
                  transactions: const [
                    {
                      "amount": {
                        "total": '70',
                        "currency": "USD",
                        "details": {
                          "subtotal": '70',
                          "shipping": '0',
                          "shipping_discount": 0,
                        },
                      },
                      "description": "The payment transaction description.",
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '5',
                            "currency": "USD",
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '10',
                            "currency": "USD",
                          },
                        ],
                      },
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
          },
          isLoading: state is Paymentloading ? true : false,
          buttonText: 'Continue',
        );
      },
    );
  }
}
