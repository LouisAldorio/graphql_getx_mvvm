class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json["city"],
      zipcode: json["zipcode"],
      geo: Geo.fromJson(json["geo"]),
    );
  }
}

class Geo {
  double longitude;
  double latitude;

  Geo({required this.longitude, required this.latitude});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      longitude: json['lat'],
      latitude: json['lng'],
    );
  }
}
