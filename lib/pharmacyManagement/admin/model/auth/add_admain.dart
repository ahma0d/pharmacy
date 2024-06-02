class RegisterModel {
  final String message;

  final AdminRegisterModel employee;

  RegisterModel({
    required this.message,
    required this.employee,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['operation'],
      employee: AdminRegisterModel.fromJson(json['employee']),
    );
  }
}

class AdminRegisterModel {
  final String statu;
  final int id;
  final String name;
  final String email;
  final String imageUrl;
  final String address;
  final String gender;

  AdminRegisterModel({
    required this.statu,
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.address,
    required this.gender,
  });

  factory AdminRegisterModel.fromJson(Map<String, dynamic> json) {
    return AdminRegisterModel(
      statu: json['statu'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['image_url'],
      address: json['address'],
      gender: json['gender'],
    );
  }
}
