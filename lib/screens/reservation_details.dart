import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({Key? key}) : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  final TextEditingController _reservationIdController =
      TextEditingController();
  DateTime? _pickupDateTime;
  DateTime? _returnDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reservation Details'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5D5CFF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Reservation Details',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Color(0xFF5D5CFF)),
            TextField(
              controller: _reservationIdController,
              decoration: const InputDecoration(
                labelText: 'Reservation ID (Required)',
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(
                        // Use showDatePicker for date and time
                        context,
                        currentTime: DateTime.now(), // Set initial date to now
                        locale: LocaleType
                            .en, // Use en for English locale (optional)
                        onChanged: (date) {
                          setState(() {
                            _pickupDateTime = date;
                          });
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        _pickupDateTime != null
                            ? _pickupDateTime!.toString()
                            : 'Pick Up Date (Required)',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(
                        // Use showDatePicker for date and time
                        context,
                        currentTime: DateTime.now(), // Set initial date to now
                        locale: LocaleType
                            .en, // Use en for English locale (optional)
                        onChanged: (date) {
                          setState(() {
                            _returnDateTime = date;
                          });
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Text(
                        _returnDateTime != null
                            ? _returnDateTime!.toString()
                            : 'Return Date (Required)',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            TextField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Duration',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Discount (Optional)',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate input and navigate to next screen (customer info)
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
