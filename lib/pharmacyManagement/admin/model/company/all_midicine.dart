class AllMedicineCompanyModel {
   int? id;
   int? barcode;
   String? dosage;
   String? name;
   String? description;
   String? image;
   CategoryOneProduct? categoryOneProduct;
   String? manufactorerName;
   TypeOneProduct? typeOneProduct;
  List<CompaniesOneProduct> companiesOneProduct = [];

  AllMedicineCompanyModel({
    required this.id,
    required this.barcode,
    required this.name,
    required this.dosage,
    required this.manufactorerName,
    required this.description,
    required this.image,
    required this.categoryOneProduct,
    required this.typeOneProduct,
    required this.companiesOneProduct,
  });

   AllMedicineCompanyModel.fromJson(Map<String, dynamic> json) {
     id = json['id'];
     barcode= json['barcode'];
     name= json['name'];
     dosage= json['dosage'];
     description= json['description'];
     image= json['image_url'];
     manufactorerName= json['manufactorer_name'];
     categoryOneProduct= CategoryOneProduct.fromJson(json['category']);
     typeOneProduct= TypeOneProduct.fromJson(json['type']);
     json['companies'].forEach((element){
     companiesOneProduct.add(CompaniesOneProduct.fromJson(element));
     }) ;
  }
}

class CategoryOneProduct {
  final String name;

  CategoryOneProduct({required this.name});

  factory CategoryOneProduct.fromJson(Map<String, dynamic> json) {
    return CategoryOneProduct(name: json['name']);
  }
}

class TypeOneProduct {
  final String name;

  TypeOneProduct({required this.name});

  factory TypeOneProduct.fromJson(Map<String, dynamic> json) {
    return TypeOneProduct(name: json['name']);
  }
}

class CompaniesOneProduct {
  final String name;
  CompanyProductItem companyProductItem;

  CompaniesOneProduct({required this.name, required this.companyProductItem});

  factory CompaniesOneProduct.fromJson(Map<String, dynamic> json) {
    return CompaniesOneProduct(
      name: json['name'],
      companyProductItem: CompanyProductItem.fromJson(
        json['company_product_items'],
      ),
    );
  }
}

class CompanyProductItem {
  final int id;
  final int price;
  final expirationDate;
  final int companyId;
  final int productId;

  CompanyProductItem({
    required this.id,
    required this.price,
    required this.expirationDate,
    required this.companyId,
    required this.productId,
  });

  factory CompanyProductItem.fromJson(Map<String, dynamic> json) {
    return CompanyProductItem(
      id: json['id'],
      price: json['price'],
      expirationDate: json['expiration_date'],
      companyId: json['companyId'],
      productId: json['productId'],
    );
  }
}

// class CompanyProductItems2 {
//   final List<CompanyProductItems> list = [];
//
//    CompanyProductItems2.fromJson(Map<String , dynamic>json){
//      json['companies'].forEach((element){
//        list.add(CompanyProductItems.fromJson(element));
//      });
//    }
// }
// class CompanyProductItems {
//
//   final int id;
//   final int price;
//   final String expirationDate;
//
//   CompanyProductItems({
//     required this.id,
//     required this.price,
//     required this.expirationDate,
//   });
//
//   factory CompanyProductItems.fromJson(Map<String, dynamic> json) {
//     return CompanyProductItems(
//       id: json['id'],
//       price: json['price'],
//       expirationDate: json['expiration_date'],
//     );
//   }
// }
