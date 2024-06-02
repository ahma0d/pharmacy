class SearchCompanyModel {
  final int score;
  final DataCompanyModel data;

  SearchCompanyModel({required this.score, required this.data});

  factory SearchCompanyModel.fromJson(Map<String, dynamic> json) {
    return SearchCompanyModel(
      score: json['score'],
      data: DataCompanyModel.fromJson(
        json['data'],
      ),
    );
  }
}

class DataCompanyModel {
  final String name;

  final int id;

  final String email;

  final String address;

  final String phone;

  DataCompanyModel({
    required this.name,
    required this.id,
    required this.email,
    required this.address,
    required this.phone,
  });

  factory DataCompanyModel.fromJson(Map<String, dynamic> json) {
    return DataCompanyModel(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      address: json['location'],
      phone: json['phone_number']
    );
  }
}
