import 'package:flutter/material.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../model/company/all_midicine.dart';

class DetailsGruds extends StatelessWidget {
  final AllMedicineCompanyModel allMedicineCompanyModel;

  const DetailsGruds({super.key, required this.allMedicineCompanyModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.appColor,
        title: NormalText(
          text: "Details Grud",
          sizeText: 20.0,
          colorText: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            ClipRRect(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: const Image(
                  image: AssetImage(
                    'assets/images/m6.jpg',
                  ),
                  fit: BoxFit.cover,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    text: allMedicineCompanyModel.name.toString(),
                    sizeText: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: "type",
                            sizeText: 14.0,
                            fontWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          NormalText(
                            text: allMedicineCompanyModel.typeOneProduct!.name
                                .toString(),
                            sizeText: 12,
                            colorText: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dosage: ",
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          NormalText(
                            text: allMedicineCompanyModel.dosage.toString(),
                            sizeText: 12,
                            colorText: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: "Barcode",
                            sizeText: 14,
                            fontWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          NormalText(
                            text: allMedicineCompanyModel.barcode.toString(),
                            sizeText: 12,
                            colorText: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      NormalText(
                        text: 'Manufactorer Name ',
                        sizeText: 14,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      NormalText(
                        text: allMedicineCompanyModel.manufactorerName
                            .toString(),
                        sizeText: 12,
                        fontWeight: FontWeight.w600,
                        colorText: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "description : ",
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  NormalText(
                    text: allMedicineCompanyModel.description.toString(),
                    sizeText: 14,
                    heightText: 1.5,
                    fontWeight: FontWeight.w600,
                    colorText: Colors.grey,
                    maxLine: 10,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "All Company manufactorer this medicine : ",
                    style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Name: ",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Price: ",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 45.0,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 20.0,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  NormalText(
                                    text: allMedicineCompanyModel
                                        .companiesOneProduct[index].name
                                        .toString(),
                                    sizeText: 12,
                                    fontWeight: FontWeight.w800,
                                    colorText: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  NormalText(
                                    text: allMedicineCompanyModel
                                        .companiesOneProduct[index]
                                        .companyProductItem
                                        .price
                                        .toString(),
                                    sizeText: 12,
                                    fontWeight: FontWeight.w800,
                                    colorText: Colors.grey,
                                  ),
                                ],
                              );
                            },
                            itemCount: allMedicineCompanyModel
                                .companiesOneProduct.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
