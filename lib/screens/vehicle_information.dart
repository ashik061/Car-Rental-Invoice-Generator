import 'package:car_rental_invoice_generator/car_model.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_invoice_generator/api_service.dart';

class VehicleInformation extends StatefulWidget {
  const VehicleInformation({Key? key}) : super(key: key);

  @override
  State<VehicleInformation> createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
  List<Car>? cars; // To store fetched cars
  String? selectedCarId;
  Car? selectedCar;

  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  Future<void> _fetchCars() async {
    final fetchedCars = await ApiService.fetchCars();
    setState(() {
      cars = fetchedCars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Vehicle Information'),
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
              'Vehicle Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Divider(color: Color(0xFF5D5CFF)),
            DropdownButtonFormField<String>(
              value: selectedCarId,
              hint: const Text('Select Vehicle Type (Required)'),
              items: cars
                  ?.map((car) => DropdownMenuItem(
                        value: car.id,
                        child: Text(car.model),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCarId = value;
                  selectedCar = cars?.firstWhere((car) => car.id == value);
                });
              },
            ),
            const SizedBox(height: 10.0),
            if (selectedCar != null) _buildCarDetails(selectedCar!),
            const SizedBox(height: 10.0),
            TextField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Charges Summary',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate input and navigate to next screen (additional charges)
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

  Widget _buildCarDetails(Car car) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(car.imageURL, height: 100.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.model,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text('${car.seats} Seats, ${car.bags} Bags'),
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hourly Rate'),
              Text(
                  '\$${car.rates.hourly.toStringAsFixed(2)}'), // Fixed escaping issue
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Daily Rate'),
              Text(
                  '\$${car.rates.daily.toStringAsFixed(2)}'), // Fixed escaping issue
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Weekly Rate'),
              Text(
                  '\$${car.rates.weekly.toStringAsFixed(2)}'), // Fixed escaping issue
            ],
          ),
        ],
      ),
    );
  }
}
