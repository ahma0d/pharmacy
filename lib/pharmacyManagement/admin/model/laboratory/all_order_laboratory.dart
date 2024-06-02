class AllOrderLaboratoryModel {
  final String title;
  final String createAt;
  final String status;
  final int quantity;
  final LaboratoryModel laboratoryModel;

  AllOrderLaboratoryModel({
    required this.title,
    required this.createAt,
    required this.status,
    required this.quantity,
    required this.laboratoryModel,
  });

  factory AllOrderLaboratoryModel.fromJson(Map<String, dynamic> json) {
    return AllOrderLaboratoryModel(
      title: json['title'],
      createAt: json['createdAt'],
      status: json['statu'],
      quantity: json['quantity'],
      laboratoryModel: LaboratoryModel.fromJson(
        json['laboratory'],
      ),
    );
  }
}

class LaboratoryModel {
  final String name;
  final String image;

  LaboratoryModel({required this.name, required this.image});

  factory LaboratoryModel.fromJson(Map<String, dynamic> json) {
    return LaboratoryModel(
      name: json['name'],
      image: json['image_url'],
    );
  }
}
