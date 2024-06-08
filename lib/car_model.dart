class Car {
  final String id;
  final String make;
  final String model;
  final int year;
  final String type;
  final int seats;
  final int bags;
  final List<String> features;
  final Rates rates;
  final String imageURL;

  const Car({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.type,
    required this.seats,
    required this.bags,
    required this.features,
    required this.rates,
    required this.imageURL,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json['id'] as String,
        make: json['make'] as String,
        model: json['model'] as String,
        year: json['year'] as int,
        type: json['type'] as String,
        seats: json['seats'] as int,
        bags: json['bags'] as int,
        features: (json['features'] as List<dynamic>).cast<String>(),
        rates: Rates.fromJson(json['rates'] as Map<String, dynamic>),
        imageURL: json['imageURL'] as String,
      );
}

class Rates {
  final double hourly;
  final double daily;
  final double weekly;

  const Rates({
    required this.hourly,
    required this.daily,
    required this.weekly,
  });

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        hourly: json['hourly'] as double,
        daily: json['daily'] as double,
        weekly: json['weekly'] as double,
      );
}
