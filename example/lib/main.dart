import 'package:esewa/esewa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pay with Esewa',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Pay with Esewa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Tap on the Floating Action Button to pay with Esewa',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
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
                  print('Payment successful');
                  print('RefId: $refId');
                },
                onFailure: (errorMessage) {
                  Navigator.pop(context);
                  print('Payment failed');
                  print('Error: $errorMessage');
                },
              ),
            ),
          );
        },
        isExtended: true,
        label: const Text('Pay with Esewa'),
        icon: const Icon(Icons.payment),
      ),
    );
  }
}
