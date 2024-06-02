import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view/screen/grud/details_grud.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/fucntion/navigate.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';

import '../../../pharmacyManagement/admin/model/company/all_midicine.dart';

class OneItemAllGrud extends StatelessWidget {
     final AllMedicineCompanyModel allMedicineCompanyModel;

    const OneItemAllGrud({super.key, required this.allMedicineCompanyModel});
  @override
  Widget build(BuildContext context) {
    return Container(
     height: 100,
     width: 104,
     decoration: BoxDecoration(
         color: AllColors.backGrud,
         borderRadius: BorderRadius.circular(20)),
     child: Padding(
       padding: const EdgeInsets.only(left: 20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
             Container(
               decoration:  BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0),
               ) ,
               child: const Image(
                 image: AssetImage("assets/images/m6.jpg"),
                 width: 100,
                 height: 100,
                 fit: BoxFit.cover,
               ),
             ),

           const SizedBox(
             height: 10,
           ),
           NormalText(
             text: allMedicineCompanyModel.name.toString(),
             fontWeight: FontWeight.w800,
             sizeText: 18.0,
             maxLine: 1,
             colorText: AllColors.appColor ,
           ),
           const SizedBox(
             height: 10,
           ),
           Row(
             children: [
               NormalText(
                 text: allMedicineCompanyModel.barcode.toString(),
                 sizeText: 14,
                 fontWeight: FontWeight.bold,
                 colorText: Colors.black,
               ),
               const SizedBox(
                 width: 10.0,
               ),

             ],
           ),
           const SizedBox(
             height: 10,
           ),
           NormalText(
             text: allMedicineCompanyModel.manufactorerName.toString(),
             fontWeight: FontWeight.w800,
             sizeText: 14.0,
             maxLine: 1,
             colorText: Colors.grey,
           ),
           const SizedBox(height: 8.0,),
           NormalText(
             text: allMedicineCompanyModel.categoryOneProduct!.name.toString(),
             fontWeight: FontWeight.w800,
             sizeText: 14.0,
             maxLine: 1,
             colorText: Colors.grey,
           ),
      ]
       ),
    ),
      );
  }
}


