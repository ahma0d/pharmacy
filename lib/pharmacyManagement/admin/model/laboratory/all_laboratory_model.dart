class AllLaboratoryModel {
  final int id;

  final String name;
  final String email;
  final String phone;

  AllLaboratoryModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory AllLaboratoryModel.fromJson(Map<String, dynamic> json) {
    return AllLaboratoryModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone_number'],
    );
  }
}
