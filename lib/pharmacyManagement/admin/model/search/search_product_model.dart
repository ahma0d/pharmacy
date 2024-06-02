class SearchProductModel {
  final  score;

  final DataProductModel dataProductModel;
  SearchProductModel({required this.score, required this.dataProductModel});

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
      score: json['score'],
      dataProductModel: DataProductModel.fromJson(
        json['data'],
      ),
    );
  }

}

class DataProductModel {
  final int id;

  final String name;

  final String manifactor;
  final String description;

  final String dosage;
  final int barcode;

  DataProductModel({
    required this.id,
    required this.name,
    required this.manifactor,
    required this.description,
    required this.dosage,
    required this.barcode,
  });

  factory DataProductModel.fromJson(Map<String, dynamic> json) {
    return DataProductModel(
      id: json['id'],
      name: json['name'],
      manifactor: json['manufactorer_name'],
      description: json['description'],
      dosage: json['dosage'],
      barcode: json['barcode'],
    );
  }
}
