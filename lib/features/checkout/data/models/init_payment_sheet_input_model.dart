class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerSession;
  final String customerId;

  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerSession,
    required this.customerId,
  });
}
