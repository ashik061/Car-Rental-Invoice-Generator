import 'package:flutter/material.dart';

class AdditionalCharge extends StatelessWidget {
  const AdditionalCharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Additional Charges'),
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
              'Additional Charges',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Color(0xFF5D5CFF)),
            CheckboxListTile(
              title: const Text('Collision Damage Waiver (\$9.00)'),
              value: false, // Initially unchecked
              onChanged: (value) {}, // Handle checkbox change (placeholder)
            ),
            const SizedBox(height: 10.0),
            CheckboxListTile(
              title: const Text('Liability Insurance (\$15.00)'),
              value: false, // Initially unchecked
              onChanged: (value) {}, // Handle checkbox change (placeholder)
            ),
            const SizedBox(height: 10.0),
            CheckboxListTile(
              title: const Text('Rental Tax (11.5%)'),
              value: false, // Initially unchecked
              onChanged: (value) {}, // Handle checkbox change (placeholder)
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate input and navigate to next screen (invoice summary)
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
