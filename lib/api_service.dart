import 'dart:convert';
import 'package:http/http.dart' as http;

import 'car_model.dart';

class ApiService {
  static const String baseUrl =
      'https://exam-server-7c41747804bf.herokuapp.com/carsList';

  static Future<List<Car>> fetchCars() async {
    final url = Uri.parse('$baseUrl/cars');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data['status'] == 'success') {
        final carList = (data['data'] as List<dynamic>)
            .map((carJson) => Car.fromJson(carJson as Map<String, dynamic>))
            .toList();
        return carList;
      } else {
        throw Exception('API error: ${data['message']}');
      }
    } else {
      throw Exception('Failed to fetch cars: ${response.statusCode}');
    }
  }
}
