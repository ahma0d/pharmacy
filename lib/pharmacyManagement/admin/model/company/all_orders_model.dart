class OrdersCompanyModel {
  final int id;
  final int totalPrice;
  final bool type;
  final String createIt;
  final int orderNumber;
  final CompanyOrderModel companyOrderModel;
  OrdersCompanyModel({
    required this.id,
    required this.orderNumber,
    required this.totalPrice,
    required this.type,
    required this.createIt,
    required this.companyOrderModel,
  });

  factory OrdersCompanyModel.fromJson(Map<String, dynamic> json) {
    return OrdersCompanyModel(
      id: json['id'],
      totalPrice: json['total_price'],
      orderNumber: json['order_number'],
      type: json['type'],
      createIt: json['createdAt'],
      companyOrderModel: CompanyOrderModel.fromJson(json['company']),
    );
  }
}

class CompanyOrderModel {
  final String name;
  final String image;
  CompanyOrderModel({
    required this.name,
    required this.image,
  });

  factory CompanyOrderModel.fromJson(Map<String, dynamic> json) {
    return CompanyOrderModel(
      name: json['name'],
      image: json['image_url'],
    );
  }
}
