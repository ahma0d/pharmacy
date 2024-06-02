class SearchModel {
  final  score;
  final DataModel data;

  SearchModel({required this.score, required this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      score: json['score'],
      data: DataModel.fromJson(
        json['data'],
      ),
    );
  }
}

class DataModel {
  final String name;

  final int id;

  final String email;

  final String address;

  final String gender;

  final String status;

  DataModel({
    required this.name,
    required this.id,
    required this.email,
    required this.address,
    required this.gender,
    required this.status,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      id: json['id'],
      email: json['email'],
      address: json['address'],
      gender: json['gender'],
      status: json['statu'],
    );
  }
}
