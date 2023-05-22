import 'package:esewa/esewa.dart';
import 'package:esewa/models/esewa_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PayWithEsewaScreen(
                onSuccess: (p0, p1) {},
                onFailure: (p0) {},
                config: EsewaConfigModel.sandbox(
                  amount: 200,
                  taxAmount: 20,
                  successUrl: '',
                  failureUrl: '',
                  productId: '',
                ),
              ),
            ));
      },
      child: const Text('Pay with Esewa'),
    );
  }
}
