import 'components.dart';

class CustomerSessionsModel {
  String? object;
  String? clientSecret;
  Components? components;
  int? created;
  String? customer;
  int? expiresAt;
  bool? livemode;

  CustomerSessionsModel({
    this.object,
    this.clientSecret,
    this.components,
    this.created,
    this.customer,
    this.expiresAt,
    this.livemode,
  });

  factory CustomerSessionsModel.fromJson(Map<String, dynamic> json) {
    return CustomerSessionsModel(
      object: json['object'] as String?,
      clientSecret: json['client_secret'] as String?,
      components: json['components'] == null
          ? null
          : Components.fromJson(json['components'] as Map<String, dynamic>),
      created: json['created'] as int?,
      customer: json['customer'] as String?,
      expiresAt: json['expires_at'] as int?,
      livemode: json['livemode'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'object': object,
    'client_secret': clientSecret,
    'components': components?.toJson(),
    'created': created,
    'customer': customer,
    'expires_at': expiresAt,
    'livemode': livemode,
  };
}
