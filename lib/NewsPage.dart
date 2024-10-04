import 'package:flutter/material.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<Newspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('Welcome to the Payment Page'),
      ),
    );
  }
}
