<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Unofficial eSewa SDK for Flutter apps to pay with eSewa.
## Features
- Pay with eSewa

## Getting started
This app depends on `flutter_inappwebview` plugin. So, you need configure following things.

## Requirements

- Dart sdk: ">=2.15.0 <4.0.0"
- Flutter: ">=3.0.0"
- Android: `minSdkVersion 19` and add support for `androidx` (see [AndroidX Migration](https://docs.flutter.dev/development/platform-integration/android/androidx-migration) to migrate an existing app)
- iOS 9.0+: `--ios-language swift`, Xcode version `>= 14.3`
- MacOS 10.11+: Xcode version `>= 14.3`

## Installation

Add `esewa` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

## Usage

```dart
Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => PayWithEsewaScreen(
      config: EsewaConfigModel.sandbox(
        amount: 10,
        taxAmount: 0,
        successUrl: 'https://example.com/success',
        failureUrl: 'https://example.com/failure',
        productId: 'product_id',
      ),
      onSuccess: (config, refId) {
        if (kDebugMode) {
          print('Payment successful');
        }
        if (kDebugMode) {
          print('RefId: $refId');
        }
        showSnackBar(context, 'Payment successful RefId: $refId');
        },
    onFailure: (errorMessage) {
        Navigator.pop(context);
        showSnackBar(context, errorMessage);
        if (kDebugMode) {
          print('Error: $errorMessage');
        }
      },
    ),
  ),
);
```