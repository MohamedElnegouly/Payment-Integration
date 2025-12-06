import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(amount: '100', currency: 'USD');
            BlocProvider.of<PaymentCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is Paymentloading ? true : false,
          buttonText: 'Continue',
        );
      },
    );
  }
}
