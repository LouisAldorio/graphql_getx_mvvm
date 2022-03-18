import 'package:graphql_getx_mvvm/data/model/address.dart';
import 'package:graphql_getx_mvvm/data/model/company.dart';

class Author {
  String id;
  String name;
  String? phone;
  String? email;
  String? website;
  Company? company;
  Address? address;

  Author(
      {required this.id,
      required this.name,
      this.phone,
      this.website,
      this.email,
      this.company,
      this.address});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
      website: json["website"],
      phone: json["phone"],
      email: json["email"],
      company: json["company"] != null ? Company.fromJson(json["company"]) : null,
      address: json["address"] != null ? Address.fromJson(json["address"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
