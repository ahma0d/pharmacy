class ProfileCompanyModel {
  final String name;

  final String email;

  final String address;

  final String phone;

  final String fax;

  ProfileCompanyModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.fax,
  });

  factory ProfileCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProfileCompanyModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      fax: json['fax'],
    );
  }
}
