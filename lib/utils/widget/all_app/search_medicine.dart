import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/company/all_midicine.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/model/grud/all_grud.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/cubit.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/home/states.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';

import 'text_normal.dart';

class SearchMedicine extends StatelessWidget {
  final AllMedicineCompanyModel allGrud;

  const SearchMedicine({
    super.key,
    required this.allGrud,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.0,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            image: AssetImage(
              "assets/images/m6.jpg",
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                NormalText(
                  text: allGrud.name.toString(),
                  fontWeight: FontWeight.bold,
                  colorText: AllColors.appColor,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    NormalText(text: "Barcode : ", sizeText: 14,),
                    const SizedBox(width: 10.0,),
                    NormalText(
                      text: allGrud.barcode.toString(),
                      colorText: Colors.grey,
                      sizeText: 16.0,
                    ),
                  ],
                ),
                const SizedBox(height: 5.0,),
                Row(
                  children: [
                    NormalText(text: "ManufactorerName : ",sizeText: 14,),
                    const SizedBox(width: 10.0,),
                    NormalText(
                      text: allGrud.manufactorerName.toString(),
                      colorText: Colors.grey,
                      sizeText: 16.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    NormalText(text: "Type : ",sizeText: 14,),
                    const SizedBox(width: 10.0,),
                    NormalText(
                      text: allGrud.typeOneProduct!.name.toString(),
                      colorText: Colors.grey,
                      sizeText: 16.0,
                    ),
                  ],
                ),
                const SizedBox(height: 5.0,),
                Expanded(
                  child: NormalText(
                    text: allGrud.dosage.toString(),
                    sizeText: 16.0,
                    fontWeight: FontWeight.w400,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                    colorText: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
