import 'package:flutter/material.dart';
// Assuming reservation_details.dart is your next screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Car Rental Invoice Generator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5D5CFF),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to reservation_details.dart screen
            Navigator.pushNamed(context,
                '/reservation_details'); // Replace with actual route name
          },
          child: const Text('Add New Invoice'),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF5D5CFF),
            minimumSize: const Size(200, 50),
          ),
        ),
      ),
    );
  }
}
