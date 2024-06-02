class UpdateEmployeeModelMain {
  final UpdateEmployeeModel updateEmployeeModel;

  final UpdatedRoleModel updatedRoleModel;

  UpdateEmployeeModelMain({
    required this.updateEmployeeModel,
    required this.updatedRoleModel,
  });

  factory UpdateEmployeeModelMain.fromJson(Map<String, dynamic> json) {
    return UpdateEmployeeModelMain(
      updateEmployeeModel: UpdateEmployeeModel.formJson(json['updatedEmployee']),
      updatedRoleModel: UpdatedRoleModel.fromJson(json['updatedRole']),
    );
  }
}

class UpdateEmployeeModel {
  final String name;
  final int id  ;
  final String email;

  final String address;

  final String gender;

  final String status;

  UpdateEmployeeModel({
    required this.name,
    required this.id,
    required this.email,
    required this.address,
    required this.gender,
    required this.status,
  });

  factory UpdateEmployeeModel.formJson(Map<String, dynamic> json) {
    return UpdateEmployeeModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      gender: json['gender'],
      status: json['statu'],
      id: json['id'],
    );
  }
}

class UpdatedRoleModel {
  final String salary;

  UpdatedRoleModel({required this.salary});

  factory UpdatedRoleModel.fromJson(Map<String, dynamic> json) {
    return UpdatedRoleModel(salary: json['salary']);
  }
}
