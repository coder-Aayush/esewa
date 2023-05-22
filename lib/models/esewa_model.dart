abstract class EsewaConfigModel {
  final bool isLive;

  EsewaConfigModel(this.isLive);

  factory EsewaConfigModel.live({
    required String merchantId,
    required double amount,
    required double taxAmount,
    double? serviceCharge,
    required String successUrl,
    required String failureUrl,
    required String productId,
    double? deliveryCharge,
  }) =>
      EsewaLiveModel(
        scd: merchantId,
        amt: amount,
        taxAmt: taxAmount,
        psc: serviceCharge,
        fu: failureUrl,
        su: successUrl,
        pId: productId,
        pdc: deliveryCharge,
      );

  factory EsewaConfigModel.sandbox({
    required double amount,
    required double taxAmount,
    double? serviceCharge,
    required String successUrl,
    required String failureUrl,
    required String productId,
    double? deliveryCharge,
  }) =>
      EsewaSandboxModel(
        amt: amount,
        taxAmt: taxAmount,
        psc: serviceCharge,
        fu: failureUrl,
        su: successUrl,
        pId: productId,
        pdc: deliveryCharge,
      );

  String get baseUrl;

  String get merchantId;

  /// Merchant code provided by eSewa

  /// Amount of product or item or ticket etc
  double get amount;

  /// Tax amount on product or item or ticket etc
  double get taxAmount;

  /// Service charge by merchant on product or item or ticket etc
  double? get serviceCharge => 0;

  /// Delivery charge by merchant on product or item or ticket etc
  double? get deliveryCharge => 0;

  /// Total payment amount including tax, service and deliver charge. [i.e tAmt = amt + txAmt + psc + tAmt]
  double get totalAmount => amount + taxAmount + (serviceCharge ?? 0) + (deliveryCharge ?? 0);

  /// A unique ID of product or item or ticket etc
  String get productId;

  /// Success URL: a redirect URL of merchant application where customer will be redirected after SUCCESSFUL transaction
  String get successUrl;

  /// Failure URL: a redirect URL of merchant application where customer will be redirected after FAILURE or PENDING transaction
  String get failureUrl;

  Map<String, dynamic> get toUrl => {
        'amt': amount,
        'txAmt': taxAmount,
        'psc': serviceCharge,
        'pdc': deliveryCharge,
        'tAmt': totalAmount,
        'pid': productId,
        'scd': merchantId,
        'su': successUrl,
        'fu': failureUrl,
      };
}

class EsewaSandboxModel extends EsewaConfigModel {
  final double amt;
  final double taxAmt;
  final double? psc;
  final double? pdc;
  final double? tAmt;
  final String pId;
  final String su;
  final String fu;

  EsewaSandboxModel({
    required this.amt,
    required this.taxAmt,
    this.psc,
    this.pdc,
    this.tAmt,
    required this.pId,
    required this.su,
    required this.fu,
  }) : super(true);

  @override
  String get baseUrl => 'https://uat.esewa.com.np/epay/main?';

  @override
  String get merchantId => "EPAYTEST";

  @override
  double get amount => amt;

  @override
  double get taxAmount => taxAmt;

  @override
  double? get serviceCharge => psc;

  @override
  double? get deliveryCharge => pdc;

  @override
  double get totalAmount => tAmt ?? super.totalAmount;

  @override
  String get productId => pId;

  @override
  String get failureUrl => fu;

  @override
  String get successUrl => su;
}

class EsewaLiveModel extends EsewaConfigModel {
  final double amt;
  final double taxAmt;
  final double? psc;
  final double? pdc;
  final String scd;
  final double? tAmt;
  final String pId;
  final String su;
  final String fu;

  EsewaLiveModel({
    required this.scd,
    required this.amt,
    required this.taxAmt,
    this.psc,
    this.pdc,
    this.tAmt,
    required this.pId,
    required this.su,
    required this.fu,
  }) : super(false);

  @override
  String get baseUrl => 'https://esewa.com.np/epay/main';

  @override
  String get merchantId => scd;

  @override
  double get amount => amt;

  @override
  double get taxAmount => taxAmt;

  @override
  double? get serviceCharge => psc;

  @override
  double? get deliveryCharge => pdc;

  @override
  double get totalAmount => tAmt ?? super.totalAmount;

  @override
  String get productId => pId;

  @override
  String get failureUrl => fu;

  @override
  String get successUrl => su;
}
