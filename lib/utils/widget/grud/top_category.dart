import 'package:flutter/material.dart';
import 'package:pharmacy_system/pharmacyManagement/admin/view_model/all_cubit/employee/cubit.dart';
import 'package:pharmacy_system/utils/core/constance/color_constance.dart';
import 'package:pharmacy_system/utils/widget/all_app/text_normal.dart';
class TopCategory extends StatelessWidget {
  const TopCategory({Key? key , required this.index}) : super(key: key);
  final int index ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(left: 8,right: 8,bottom:7),
      margin: EdgeInsets.only(left: size.height / 70, top: size.height / 90),
      height: size.height * .24,
      width: size.height * .16,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(
              'assets/images/1.jpg',
            ),
            fit: BoxFit.fill
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.1),
      ),
      child: Stack(children: [
        Positioned(
        bottom: 10,
          right: 6,
          left: 8,
          child: NormalText(
            text: "",
            sizeText: 16,
            maxLine: 1,
            fontWeight: FontWeight.bold,
            colorText: Colors.black,
          ),
        )
      ]),
    );
  }
}
