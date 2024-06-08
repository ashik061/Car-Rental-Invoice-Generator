import 'package:flutter/material.dart';

class CustomerInformation extends StatelessWidget {
  const CustomerInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Customer Information'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5D5CFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Customer Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Color(0xFF5D5CFF)),
            TextField(
              decoration: const InputDecoration(
                labelText: 'First Name (Required)',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Last Name (Required)',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email (Required)',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone Number (Required)',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate input and navigate to next screen (vehicle info)
              },
              child: const Text('Next'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF5D5CFF),
                minimumSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
