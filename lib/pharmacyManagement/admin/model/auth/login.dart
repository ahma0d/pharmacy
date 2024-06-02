class LoginModel {
  final String message;
  final String operation;
  final String token;
  final EmployeeModel employeeModel;

  LoginModel({
    required this.message,
    required this.operation,
    required this.token,
    required this.employeeModel,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      operation: json['operation'],
      token: json['token'],
      employeeModel: EmployeeModel.fromJson(json['employee']),
    );
  }
}

class EmployeeModel {
  final int id;
  final String name;

  final String email;
  final String image;
  final String gender;
  final String address;
  final String token;
  final bool status;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.gender,
    required this.address,
    required this.token,
    required this.status,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      image: json['image_url'],
      gender: json['gender'],
      address: json['address'],
      token: json['token'],
      status: json['statu'],
    );
  }
}
