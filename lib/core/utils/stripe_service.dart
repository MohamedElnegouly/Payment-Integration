import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/api_service.dart';
import 'package:payment_integration/features/checkout/data/models/customer_sessions_model/customer_sessions_model.dart';
import 'package:payment_integration/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

//flow
//paymentintentobject create payment intent (amount , currency)
// init payment sheet (paymentIntentClientSecret)
// present payment sheet

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      body: paymentIntentInputModel.tojson(),
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<CustomerSessionsModel> customerSessions({required customerId}) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/customer_sessions',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      body: {
        'customer': customerId,
        "components[mobile_payment_element][enabled]": "true",
      },
    );
    var customerSessions = CustomerSessionsModel.fromJson(response.data);
    return customerSessions;
  }

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initpaymentsheetinputmodel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initpaymentsheetinputmodel.clientSecret,
        customerSessionClientSecret: initpaymentsheetinputmodel.customerSession,
        customerId: initpaymentsheetinputmodel.customerId,
        merchantDisplayName: 'Mohamed Elngouly',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // this step to start payment flow (create make method that contain all steps)
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentintentmodel = await createPaymentIntent(paymentIntentInputModel);
    var customerSession = await customerSessions(
      customerId: paymentIntentInputModel.customerId,
    );
    var initpaymentsheetinputmodel = InitPaymentSheetInputModel(
      clientSecret: paymentintentmodel.clientSecret!,
      customerSession: customerSession.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(
      initpaymentsheetinputmodel: initpaymentsheetinputmodel,
    );
    await displayPaymentSheet();
  }
}
