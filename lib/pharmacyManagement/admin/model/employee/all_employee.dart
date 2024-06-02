import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_company.dart';

class AllEmployeeModel {
  final String name;
  final int id;
  final String email;
  final String gender;
  final String address;
  final String image;
  final String statu ;

  AllEmployeeModel({
    required this.name,
    required this.id,
    required this.email,
    required this.gender,
    required this.address,
    required this.image,
    required this.statu,
  });

  factory AllEmployeeModel.fromJson(Map<String, dynamic> json) {
    return AllEmployeeModel(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      gender: json['gender'],
      address: json['address'],
      image: json['image_url'],
      statu: json['statu'],
    );
  }
}
