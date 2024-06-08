import 'package:flutter/material.dart';
import 'package:car_rental_invoice_generator/screens/home_screen.dart';

void main() {
  runApp(const CarRentalInvoiceGeneratorApp());
}

class CarRentalInvoiceGeneratorApp extends StatelessWidget {
  const CarRentalInvoiceGeneratorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Rental Invoice Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Set home screen to HomeScreen
    );
  }
}
