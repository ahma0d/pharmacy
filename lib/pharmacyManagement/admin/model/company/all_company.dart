class AllCompanyModel {
  final String name;
  final int companyTypeId ;
  final int id;
  final String location ;
  final String email;
  final String phone;
  AllCompanyModel({
    required this.name,
    required this.id,
    required this.companyTypeId,
    required this.email,
    required this.phone,
    required this.location ,
  });

  factory AllCompanyModel.fromJson(Map<String, dynamic> json) {
    return AllCompanyModel(
      name: json['name'],
      id: json['id'],
      companyTypeId: json['companiesTypeId'],
      location: json['location'],
      email: json['email'],
      phone: json['phone_number'],
    );
  }
}
