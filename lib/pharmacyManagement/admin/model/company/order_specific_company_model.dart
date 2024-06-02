
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_orders_model.dart';

class SpecificOrderModel {
  int? id;
  int? totalPrice;
  bool? type;
  String? createIt;
  CompanyOrderModel? companyOrderModel;
  List<CompanyProductItemsModel> model = [];

  SpecificOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['total_price'];
    type = json['type'];
    createIt = json['createdAt'];
    companyOrderModel = CompanyOrderModel.fromJson(json['company']);
     json['company_product_items'].forEach((element) {
      model.add(
        CompanyProductItemsModel.fromJson(element),
      );
    });
  }
}

class CompanyProductItemsModel {
  final int price;
  final ProductOrderCompanyModel productOrderCompanyModel;
  final BuyOrderItemModel buyOrderItemModel;

  CompanyProductItemsModel({
    required this.price,
    required this.productOrderCompanyModel,
    required this.buyOrderItemModel,
  });

  factory CompanyProductItemsModel.fromJson(Map<String, dynamic> json) {
    return CompanyProductItemsModel(
      price: json['price'],
      productOrderCompanyModel: ProductOrderCompanyModel.fromJson(
        json['product'],
      ),
      buyOrderItemModel: BuyOrderItemModel.fromJson(
        json['buy_order_items'],
      ),
    );
  }
}

class ProductOrderCompanyModel {
  final int barcode;
  final String name;
  final String image;

  ProductOrderCompanyModel({
    required this.barcode,
    required this.name,
    required this.image,
  });

  factory ProductOrderCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductOrderCompanyModel(
      barcode: json['barcode'],
      name: json['name'],
      image: json['image_url'],
    );
  }
}

class BuyOrderItemModel {
  final int id;
  final int quantity;
  final int totalPrice;

  BuyOrderItemModel({
    required this.id,
    required this.quantity,
    required this.totalPrice,
  });

  factory BuyOrderItemModel.fromJson(Map<String, dynamic> json) {
    return BuyOrderItemModel(
      id: json['id'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
    );
  }
}
