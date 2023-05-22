import 'package:esewa/models/esewa_model.dart';
import 'package:flutter/material.dart';

/// Typedef for callback function
///
typedef EsewaSuccessCallback = void Function(EsewaConfigModel, String);

typedef EsewsFailureCallback = void Function(String?);

class PayWithEsewaScreen extends StatelessWidget {
  /// EsewaConfigModel.live() or EsewaConfigModel.sandbox()
  final EsewaConfigModel config;

  /// Callback function that will be called when payment is successful
  /// returns [EsewaConfigModel] and [String] as refId
  ///
  final EsewaSuccessCallback onSuccess;

  ///
  /// Callback function that will be called when payment is failed
  /// returns  [String?] as errorMessage
  final EsewsFailureCallback onFailure;

  const PayWithEsewaScreen({Key? key, required this.config, required this.onSuccess, required this.onFailure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
