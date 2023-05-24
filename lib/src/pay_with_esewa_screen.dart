import 'package:esewa/models/esewa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Typedef for callback function
///
typedef EsewaSuccessCallback = void Function(EsewaConfigModel config, String refId);

typedef EsewsFailureCallback = void Function(String errorMessage);

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
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: config.uri),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
          ),
        ),
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final url = navigationAction.request.url.toString();
          final uri = Uri.parse(url);
          if (url.contains(config.successUrl) && uri.queryParameters.containsKey('refId')) {
            final refId = uri.queryParameters['refId'];
            onSuccess.call(config, refId!);
            return NavigationActionPolicy.ALLOW;
          } else if (url.contains(config.failureUrl) || url.contains('failure')) {
            final errorMessage = uri.queryParameters['error'];
            onFailure.call(errorMessage ?? 'Sorry your request failed');
            return NavigationActionPolicy.ALLOW;
          }
          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }
}
