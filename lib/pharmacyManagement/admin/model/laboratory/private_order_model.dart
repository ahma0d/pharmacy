import 'all_order_laboratory.dart';

class PrivateOrderLaboratoryModel {
  final int id;
  final String name;
  final String description;
  final String use;
  final int quantity;
  final int orderNumber;
  final String createdAt;
  final String status ;
  final LaboratoryModel laboratoryModel;

  PrivateOrderLaboratoryModel({
    required this.id,
    required this.status,
    required this.name,
    required this.description,
    required this.use,
    required this.quantity,
    required this.orderNumber,
    required this.createdAt,
    required this.laboratoryModel,
  });

  factory PrivateOrderLaboratoryModel.fromJson(Map<String, dynamic> json) {
    return PrivateOrderLaboratoryModel(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      use: json['usage'],
      quantity: json['quantity'],
      orderNumber: json['order_number'],
      createdAt: json['createdAt'],
      status: json['statu'],
      laboratoryModel: LaboratoryModel.fromJson(
        json['laboratory'],
      ),
    );
  }
}
